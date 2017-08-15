//
//  ProductViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 15/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artworkImageView: UIImageView!

    @IBOutlet weak var favouriteButton: UIButton!

    var product: RSProduct?
    var artwork: RSWork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.setImage(fromUrl: product?.imageUrl ?? "")
        artworkImageView.setImage(fromUrl: artwork?.imageUrl ?? "")
        refreshUI(to: product?.isSaved ?? false)
        
        artworkImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.artworkPressed(_:)))
        artworkImageView.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func refreshUI(to favourited: Bool) {
        DispatchQueue.main.async {
            self.favouriteButton.imageView?.image = favourited ? Image.filledHeart : Image.heart
        }
    }

    @IBAction func favouriteButtonPressed(_ sender: UIButton) {

        guard let p = product else { return }

        let realm = RealmManager.shared.realm
        try? realm?.write {
            product?.isSaved = !p.isSaved
        }

        refreshUI(to: product?.isSaved ?? false)
    }
    
    fileprivate func artworkPressed(_ sender: UIImageView) {
        let artworkVC = UIStoryboard(storyboard: .main).instantiateViewController() as ArtworkViewController
        artworkVC.artwork = artwork
        if let artistName = artwork?.artistName {
            let artist = RealmManager.shared.realm.object(ofType: RSArtist.self, forPrimaryKey: artistName)
            artworkVC.artist = artist
        }
        navigationController?.pushViewController(artworkVC, animated: true)
    }
}
