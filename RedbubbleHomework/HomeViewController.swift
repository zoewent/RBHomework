//
//  HomeViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

protocol HomeViewControllerSegmentable: class {
    func resetDataSource(with category: ItemCategory)
}

class HomeViewController: UIViewController {
    private let segueIdentifier = "SegueIdentifierToPageViewController"
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var productCategory: ItemCategory = .all
    var artworkCategory: ItemCategory = .all
    
    weak var delegate: HomeViewControllerSegmentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.tintColor = ColorPalette.rbRed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let pageViewController = segue.destination as? GridPageViewController
            pageViewController?.parentVC = self
        }
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            delegate?.resetDataSource(with: .all)
        case 1:
            delegate?.resetDataSource(with: .saved)
        case 2:
            delegate?.resetDataSource(with: .unsaved)
        default:
            delegate?.resetDataSource(with: .all)
        }
    }
}
