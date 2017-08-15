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
    
    @IBOutlet weak var artworkButton: UIButton!
    var product: RSProduct?
    var artwork: RSWork?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.setImage(fromUrl: product?.imageUrl ?? "")
        self.artworkButton.imageView?.setImage(fromUrl: artwork?.imageUrl ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func artworkButtonPressed(_ sender: UIButton) {
        let artworkVC = UIStoryboard(storyboard: .main).instantiateViewController() as ArtworkViewController
        artworkVC.artwork = artwork
        if let artistName = artwork?.artistName {
            let artist = RealmManager.shared.realm.object(ofType: RSArtist.self, forPrimaryKey: artistName)
            artworkVC.artist = artist
        }
        navigationController?.pushViewController(artworkVC, animated: true)
    }

}
