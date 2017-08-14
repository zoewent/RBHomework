//
//  GridPageViewController.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit

enum Page: Int {
    case product
    case artwork
    
    static var initialPage: Page = .product
}

enum ItemCategory {
    case all
    case saved
    case unsaved
}

class GridPageViewController: UIPageViewController, HomeViewControllerSegmentable {
    
    var currentPage: Page = Page.initialPage {
        didSet {
            guard currentPage != oldValue else {
                return
            }
            let direction: UIPageViewControllerNavigationDirection = currentPage.rawValue > oldValue.rawValue ? .forward : .reverse
            
            setViewControllers(
                [gridViewControllers[currentPage.rawValue]],
                direction: direction,
                animated: false,
                completion: nil)
        }
    }

    var itemCategory: ItemCategory = .all {
        didSet{
            print("\(itemCategory)")
        }
    }
    
    var products: [RSProduct]?
    var artworks:[RSWork]?
    fileprivate var gridViewControllers = [GridCollectionViewController]()
    
    var parentVC: HomeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        parentVC?.delegate = self
        
        fetch()
        instantiatePages()
        
        setViewControllers(
            [gridViewControllers[currentPage.rawValue]],
            direction: .forward,
            animated: false,
            completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func instantiatePages() {
        gridViewControllers.removeAll()
        
        let productGrid = UIStoryboard(storyboard: .main).instantiateViewController() as GridCollectionViewController
        let artworkGrid = UIStoryboard(storyboard: .main).instantiateViewController() as GridCollectionViewController
        productGrid.page = .product
        productGrid.products = products ?? []
        artworkGrid.page = .artwork
        artworkGrid.artworks = artworks ?? []
        
        gridViewControllers.append(productGrid)
        gridViewControllers.append(artworkGrid)

    }
    
    fileprivate func fetch() {
        products = RealmManager.shared.realm.objects(RSProduct.self).map { $0 as RSProduct }
        artworks = RealmManager.shared.realm.objects(RSWork.self).map { $0 as RSWork }
    }
    
    // MARK: HomeViewControllerSegmentable
    
    func resetDataSource(with category: ItemCategory) {
        self.itemCategory = category
        if currentPage == .artwork {
            let gridVC = gridViewControllers.last
            gridVC?.category = category
        } else {
            let gridVC = gridViewControllers.first
            gridVC?.category = category
        }
    }
}

extension GridPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = gridViewControllers.index(of: viewController as! GridCollectionViewController) {
            if index == 0 {
                return nil
            } else {
                currentPage = .product
                return gridViewControllers.first
            }
            
        }
        
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = gridViewControllers.index(of: viewController as! GridCollectionViewController) {
            
            if index == 0 {
                currentPage = .artwork
                return gridViewControllers.last
            } else {
                return nil
            }
        }
        
        return nil
    }
}
