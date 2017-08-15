//
//  ArtworkViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 15/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class ArtworkViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    var artwork: RSWork?
    var artist: RSArtist?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.title = "Artwork"
        imageView.setImage(fromUrl: artwork?.imageUrl ?? "")
        titleLabel.text = artwork?.title ?? ""
        avatarImage.stylify(.round)
        avatarImage.setImage(fromUrl: artist?.avatarImageUrl ?? "")
        artistNameLabel.text = artwork?.artistName
        refreshUI(to: artwork?.isSaved ?? false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func refreshUI(to favourited: Bool) {
        DispatchQueue.main.async {
            self.favouriteButton.imageView?.image = favourited ? Image.filledHeart : Image.heart
        }
    }

    @IBAction func favouriteButtonPressed(_ sender: UIButton) {

        guard let work = artwork else { return }

        let realm = RealmManager.shared.realm
        try? realm?.write {
            artwork?.isSaved = !work.isSaved
        }

        refreshUI(to: artwork?.isSaved ?? false)
    }
}
