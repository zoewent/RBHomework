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
        case round
    }
    
    func stylify(_ style: Style) {
        switch style {
        case .default:
            contentMode = .scaleAspectFill
            clipsToBounds = true
        case .round:
            contentMode = .scaleAspectFill
            clipsToBounds = true
            let radius = frame.size.height > frame.size.width ? frame.size.width/2 : frame.size.height/2
            layer.cornerRadius = radius
        }
    }
}
