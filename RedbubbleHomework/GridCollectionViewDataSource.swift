//
//  GridCollectionViewDataSource.swift
//  RedbubbleHomework
//
//  Created by Zoe on 13/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

fileprivate let ProductGridCollectionViewCellIdentifier = "ProductGridCollectionViewCell"
fileprivate let ArtworkGridCollectionViewCellIdentifier = "ArtworkGridCollectionViewCell"

class GridCollectionViewDataSource: NSObject {
    var page: Page
    var resuableCellIdentifier: String
    var products: [RSProduct]?
    var artworks:[RSWork]?
    
    init(page: Page,
         products: [RSProduct]? = nil,
         artworks: [RSWork]? = nil) {
        
        self.page = page
        
        switch page {
        case .product:
            self.resuableCellIdentifier = ProductGridCollectionViewCellIdentifier
            self.products = products
//            self.artworks = 
        case .artwork:
            self.resuableCellIdentifier = ArtworkGridCollectionViewCellIdentifier
//            self.products = []
            self.artworks = artworks
        }
    }
}

extension GridCollectionViewDataSource : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch page {
        case .product:
            return products?.count ?? 0
        case .artwork:
            return artworks?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resuableCellIdentifier, for: indexPath)
        
        switch page {
        case .product:
            if let c = cell as? ProductGridCollectionViewCell {
                c.product = products?[indexPath.row]
                return c
            }
        case .artwork:
            if let c = cell as? ArtworkGridCollectionViewCell {
                c.artwork = artworks?[indexPath.row]
                return c
            }
        }
        
        return cell
    }
}
