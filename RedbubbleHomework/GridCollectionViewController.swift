//
//  GridCollectionViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

class GridCollectionViewController: UICollectionViewController {

    var page: Page?
    var products: [RSProduct]?
    var artworks:[RSWork]?
    fileprivate var pageType = Page.product
    fileprivate var collectionViewDataSource: GridCollectionViewDataSource?
    var category: ItemCategory = .all {
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
    
    fileprivate func reset() {

        fetch(with: category)

        if pageType == .product {
            collectionViewDataSource = GridCollectionViewDataSource(page: pageType, products: products ?? [])
        } else {
            collectionViewDataSource = GridCollectionViewDataSource(page: pageType, artworks: artworks ?? [])
        }
        
        self.collectionView?.dataSource = collectionViewDataSource
        collectionView?.reloadData()
    }

    fileprivate func fetch(with category: ItemCategory) {
        let realm = RealmManager.shared.realm
        if pageType == .product {
            switch category {
            case .all:
                products = realm?.objects(RSProduct.self).map { $0 as RSProduct }
            case .saved:
                products = realm?.objects(RSProduct.self).filter("isSaved == %@", true).map { $0 as RSProduct }
            case .unsaved:
                products = realm?.objects(RSProduct.self).filter("isSaved == %@", false).map { $0 as RSProduct }
            }
        } else {
            switch category {
            case .all:
                artworks = realm?.objects(RSWork.self).map { $0 as RSWork }
            case .saved:
                artworks = realm?.objects(RSWork.self).filter("isSaved == %@", true).map { $0 as RSWork }
            case .unsaved:
                artworks = realm?.objects(RSWork.self).filter("isSaved == %@", false).map { $0 as RSWork }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch pageType {
        case .product:
            let product = products?[indexPath.row]
            let productVC = UIStoryboard(storyboard: .main).instantiateViewController() as ProductViewController
            productVC.product = product

            if let workId = product?.workId {
                let artwork = RealmManager.shared.realm.object(ofType: RSWork.self, forPrimaryKey: workId)
                productVC.artwork = artwork
            }
            navigationController?.pushViewController(productVC, animated: true)

        case .artwork:
            let artwork = artworks?[indexPath.row]
            let artworkVC = UIStoryboard(storyboard: .main).instantiateViewController() as ArtworkViewController
            artworkVC.artwork = artwork
            if let artistName = artwork?.artistName {
                let artist = RealmManager.shared.realm.object(ofType: RSArtist.self, forPrimaryKey: artistName)
                artworkVC.artist = artist
            }
            navigationController?.pushViewController(artworkVC, animated: true)
        }
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
