//
//  AvatarImg.swift
//  MiInventario
//
//  Created by Daniel Llamas on 7/25/16.
//  Copyright © 2016 Llamas. All rights reserved.
//

import UIKit

class AvatarImg: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 42.0
        self.clipsToBounds = true
        
    }

}
