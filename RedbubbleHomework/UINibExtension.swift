//
//  UINibExtension.swift
//  RedbubbleHomework
//
//  Created by Zoe on 13/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

extension UINib {
    static func instantiateView<T: UIView>(withOwner owner: Any? = nil) -> T where T: NIBIdentifiable {
        guard let view = Bundle.main.loadNibNamed(T.nibIdentifier, owner: owner, options: nil)?.first as? T else {
            fatalError("Couldn't instantiate view with identifier \(T.nibIdentifier) ")
        }
        return view
    }
}

extension UIView : NIBIdentifiable { }

// MARK: identifiable

protocol NIBIdentifiable {
    static var nibIdentifier: String { get }
}

extension NIBIdentifiable where Self: UIView {
    static var nibIdentifier: String {
        return String(describing: self)
    }
}
