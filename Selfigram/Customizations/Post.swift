//
//  Post.swift
//  Selfigram
//
//  Created by Matt Peatling on 2017-08-16.
//  Copyright © 2017 Matt Peatling. All rights reserved.
//

import Foundation
import UIKit
class Post {
    let image:UIImage
    let user: User
    let comment:String
    
    init(image:UIImage, user:User, comment:String){
        self.image = image
        self.user = user
        self.comment = comment
        
    }
}
