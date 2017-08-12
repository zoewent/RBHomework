//
//  UIImageView+Networking.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(fromUrl url: String) {
        self.image = Image.placeholder
        
        ImageCache.shared.loadImage(withUrl: url) { result in
            switch result {
            case .success(let image):
                self.image = image
            case .failure(_):
                self.image = Image.placeholder 
            }
        }
    }
}
