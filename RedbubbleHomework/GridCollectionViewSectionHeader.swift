//
//  GridCollectionHeader.swift
//  RedbubbleHomework
//
//  Created by Zoe on 14/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class GridCollectionViewSectionHeader: UICollectionReusableView {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentedControl.tintColor = ColorPalette.rbRed
    }
    
}
