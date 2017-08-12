//
//  UIImageView+Style.swift
//  RedbubbleHomework
//
//  Created by Zoe on 13/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

extension UIImageView {
    enum Style {
        case `default`
    }
    
    func stylify(_ style: Style) {
        switch style {
        case .default:
            contentMode = .scaleAspectFill
            clipsToBounds = true
        }
    }
}
