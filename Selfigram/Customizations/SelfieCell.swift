//
//  SelfieCell.swift
//  Selfigram
//
//  Created by Matt Peatling on 2017-08-23.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import UIKit

class SelfieCell: UITableViewCell {
    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
