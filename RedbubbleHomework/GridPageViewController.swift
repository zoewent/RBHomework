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

class GridPageViewController: UIPageViewController {
    
    var currentPage: Page = Page.initialPage {
        didSet {
            guard currentPage != oldValue else {
                return
            }
            let direction: UIPageViewControllerNavigationDirection = currentPage.rawValue > oldValue.rawValue ? .forward : .reverse
            setViewControllers(
                [gridViewControllers[currentPage.rawValue]],
                direction: direction,
                animated: true,
                completion: nil)
        }
    }
    
    fileprivate var gridViewControllers = [GridCollectionViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
        dataSource = self
        
        instantiatePages()
//        updateDataSource()
//        fetch()
        setViewControllers(
            [gridViewControllers[currentPage.rawValue]],
            direction: .forward,
            animated: false,
            completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    fileprivate func reloadPages() {
//        gridViewControllers[Page.product.rawValue] =
    }
}

extension GridPageViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        if let index = menuViewControllers.index(of: viewController as! MenuViewController) {
//            if index == 0 {
//                return nil
//            }
//            return menuViewControllers[index - 1]
//        }
        
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        if let index = menuViewControllers.index(of: viewController as! MenuViewController) {
//            if index == menuViewControllers.count - 1 {
//                return nil
//            }
//            return menuViewControllers[index + 1]
//        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if let index = menuViewControllers.index(of: pageViewController.viewControllers![0] as! MenuViewController) {
//            currentPage = Page(rawValue: index) ?? Page.initialPage
//        }
//        menuPageDelegate?.menuPageView(self, didScrollToPage: currentPage)
    }
}
