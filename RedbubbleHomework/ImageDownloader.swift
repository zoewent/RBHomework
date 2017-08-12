//
//  ImageDownloader.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation

class ImageDownloader {
    static let shared = ImageDownloader()
    private let session: URLSession
    
    init() {
        session = URLSession(configuration: .default)
    }
    
    typealias ImageDownloaderCompletionHandler = (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> ()
    
    func getDataFromUrl(url: String, completion: @escaping ImageDownloaderCompletionHandler) {
        
        guard let imageUrl = URL(string: url) else { return }
        
        session.dataTask(with: imageUrl) { (data, response, error) in
            completion(data, response, error)
        }.resume()
    }
}
