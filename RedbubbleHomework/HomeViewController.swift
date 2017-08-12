//
//  HomeViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.tintColor = ColorPalette.rbRed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
