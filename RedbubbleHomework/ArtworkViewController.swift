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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
