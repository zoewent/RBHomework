//
//  ArtworkGridCollectionViewCell.swift
//  RedbubbleHomework
//
//  Created by Zoe on 13/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

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
        imageView.image = nil
    }
    
    private func updateUI() {
        if let url = artwork?.imageUrl {
            imageView.setImage(fromUrl: url)
        }
    }

}
