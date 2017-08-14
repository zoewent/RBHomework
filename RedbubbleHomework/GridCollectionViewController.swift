//
//  GridCollectionViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class GridCollectionViewController: UICollectionViewController, HomeViewControllerSegmentable {

    var page: Page?
    var products: [RSProduct]?
    var artworks:[RSWork]?
    fileprivate var pageType = Page.product
    fileprivate var collectionViewDataSource: GridCollectionViewDataSource?
    fileprivate var category: ItemCategory = .all {
        didSet {
            reset()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let _ = page else {
            fatalError("GridCollectionViewController must have Page type")
        }
        
        pageType = page!
        reset()
        
        guard let collectionViewDataSource = collectionViewDataSource else { return }
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = collectionViewDataSource
        
        let cellNib = UINib(nibName: collectionViewDataSource.resuableCellIdentifier, bundle: Bundle.main)
        collectionView?.register(cellNib, forCellWithReuseIdentifier: collectionViewDataSource.resuableCellIdentifier)
    }
    
//    fileprivate func registerNotification() {
//        let saved = Notification.Name("saved")
//        let unsaved = Notification.Name("unsaved")
//        let all = Notification.Name("all")
//        
//        NotificationCenter.default.addObserver(forName: saved, object: self, queue: nil) { _ in
//            self.category = .saved
//        }
//        
//        NotificationCenter.default.addObserver(forName: unsaved, object: self, queue: nil) { _ in
//            self.category = .unsaved
//        }
//        
//        NotificationCenter.default.addObserver(forName: all, object: self, queue: nil) { _ in
//            self.category = .all
//        }
//    }
    
    fileprivate func reset() {
        switch category {
        case .all:
            collectionViewDataSource = GridCollectionViewDataSource(page: pageType, products: products ?? [], artworks: artworks ?? [])
        case .saved:
            let savedProducts = products?.filter { $0.isSaved }
            let savedArtwork = artworks?.filter { $0.isSaved }
            collectionViewDataSource = GridCollectionViewDataSource(page: pageType, products: savedProducts ?? [], artworks: savedArtwork ?? [])
        case .unsaved:
            let unsavedProducts = products?.filter { !$0.isSaved }
            let unsavedArtwork = artworks?.filter { !$0.isSaved }
            collectionViewDataSource = GridCollectionViewDataSource(page: pageType, products: unsavedProducts ?? [], artworks: unsavedArtwork ?? [])
        }
        
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: HomeViewControllerSegmentable
    
    func resetDataSource(with category: ItemCategory) {
        self.category = category
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

fileprivate let itemsPerRow: CGFloat = 2
fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

extension GridCollectionViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
