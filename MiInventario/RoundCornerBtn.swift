//
//  RoundCornerBtn.swift
//  MiInventario
//
//  Created by Nivelate Online on 7/19/16.
//  Copyright © 2016 Llamas. All rights reserved.
//

import UIKit

class RoundCornerBtn: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
    }

}
