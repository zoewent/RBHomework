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

protocol PageViewControllerSegmentable: class {
    func resetSegment(with category: ItemCategory)
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

    fileprivate var gridViewControllers = [GridCollectionViewController]()
    
    var parentVC: HomeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        parentVC?.delegate = self
        instantiatePages()

        if let firstVC = gridViewControllers.first {
            setViewControllers(
                [firstVC],
                direction: .forward,
                animated: false,
                completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func instantiatePages() {
        gridViewControllers.removeAll()
        
        let productGrid = UIStoryboard(storyboard: .main).instantiateViewController() as GridCollectionViewController
        let artworkGrid = UIStoryboard(storyboard: .main).instantiateViewController() as GridCollectionViewController
        productGrid.page = .product
        artworkGrid.page = .artwork

        gridViewControllers.append(productGrid)
        gridViewControllers.append(artworkGrid)

    }
    
    // MARK: HomeViewControllerSegmentable
    
    func resetDataSource(with category: ItemCategory) {
        self.itemCategory = category
        if currentPage == .artwork {
            let gridVC = gridViewControllers.last
            gridVC?.category = category
        }
            
        if currentPage == .product {
            let gridVC = gridViewControllers.first
            gridVC?.category = category
        }
    }
}

extension GridPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        /*
        guard let viewControllerIndex = gridViewControllers.index(of: viewController as! GridCollectionViewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard gridViewControllers.count > previousIndex else {
            return nil
        }

//        currentPage = .product

        return gridViewControllers[previousIndex]
        */

//        let vc = viewController as! GridCollectionViewController
//
//        if vc.page == .product {
//            currentPage = .product
//            return gridViewControllers.first
////            return nil
//        } else {
//            currentPage = .product
//            return gridViewControllers.first
//        }


        if let index = gridViewControllers.index(of: viewController as! GridCollectionViewController) {
            if index == 0 {
                //check
                return nil
            } else {
//                currentPage = .product
                return gridViewControllers.first
            }
            
        }

        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        /*
        guard let viewControllerIndex = gridViewControllers.index(of: viewController as! GridCollectionViewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1

        let orderedViewControllersCount = gridViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
            return nil
        }

        guard orderedViewControllersCount > nextIndex else {
            return nil
        }

//        currentPage = .artwork

        return gridViewControllers[nextIndex]
        */

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
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard previousViewControllers.count == 1 else { return }
        
        let viewController = previousViewControllers.first as! GridCollectionViewController
        
        if viewController.page == .product {
            currentPage = .artwork
            viewController.category = itemCategory
        }
        
        if viewController.page == .artwork {
            currentPage = .product
            viewController.category = itemCategory
        }
        
    }
}
