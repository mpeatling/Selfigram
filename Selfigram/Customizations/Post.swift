//
//  Post.swift
//  Selfigram
//
//  Created by Matt Peatling on 2017-08-16.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Post: PFObject, PFSubclassing {
    @NSManaged var image:PFFile
    @NSManaged var user: PFUser
    @NSManaged var comment:String
   
    static func parseClassName() -> String {
        return "Post"
    }
    
    convenience init(image:PFFile, user:PFUser, comment:String){
        self.init()
        self.image = image
        self.user = user
        self.comment = comment
    }

    
    
}
