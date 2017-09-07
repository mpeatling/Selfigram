//
//  ProfileViewController.swift
//  Selfigram
//
//  Created by Matt Peatling on 2017-08-14.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let user = PFUser.current() {
            usernameLabel.text = user.username
        if let imageFile = user["avatarImage"] as? PFFile {
            imageFile.getDataInBackground(block: { (data, error) -> Void in
                if let imageData = data {
                    self.profileImageView.image = UIImage(data: imageData)
                }
            })
        }
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text = "Matthew"

        // Do any additional setup after loading the view.
    }

    @IBAction func cameraButtonPressed(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .camera
        pickerController.cameraDevice = .front
        pickerController.cameraCaptureMode = .photo
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if let imageData = UIImageJPEGRepresentation(image, 0.9),
                let imageFile = PFFile(data: imageData),
                let user = PFUser.current(){
                // avatarImage is a new column in our User table
                user["avatarImage"] = imageFile
                user.saveInBackground(block: { (success, error) -> Void in
                    if success {
                        print("avatarImage successfully saved")
                    }
                })
                
            }

    }
        dismiss(animated: true, completion: nil)
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
