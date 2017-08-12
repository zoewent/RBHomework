//
//  GridCollectionViewCell.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class ProductGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var product: RSProduct? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.stylify(.default)
    }
    
    private func updateUI() {
        if let url = product?.imageUrl {
            imageView.setImage(fromUrl: url)
        }
    }
}

class ArtworkGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var artwork: RSWork? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.stylify(.default)
    }
    
    private func updateUI() {
        if let url = artwork?.imageUrl {
            imageView.setImage(fromUrl: url)
        }
    }
}
