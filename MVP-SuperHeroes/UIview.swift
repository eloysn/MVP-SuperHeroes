//
//  UIview.swift
//  MVP-SuperHeroes
//
//  Created by appsistemas on 19/4/18.
//  Copyright © 2018 eloysn. All rights reserved.
//

import UIKit

extension UIView {
    
    func rounded(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.rounded(radius: radius)
    }
    
    func rounded(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
