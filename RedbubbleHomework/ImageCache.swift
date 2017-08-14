//
//  ImageCache.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import UIKit

enum LoadImageResult {
    case failure(Error)
    case success(UIImage)
}

class ImageCache {
    static let shared = ImageCache()
    let cache = NSCache<NSString, AnyObject>()
    
    fileprivate init() {}
    
    func loadImage(withUrl url: String, complete: @escaping (LoadImageResult) -> Void)  {
        if let cachedImage = ImageCache.shared.cache.object(forKey: url as NSString) as? UIImage {
            complete(.success(cachedImage))
            return
        }
        
        ImageDownloader.shared.getDataFromUrl(url: url) { (data, response, error) in
            guard error == nil else {
                complete(.failure(error!))
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        ImageCache.shared.cache.setObject(image, forKey: url as NSString)
                        complete(.success(image))
                    }
                }
            }
        }
    }
}
