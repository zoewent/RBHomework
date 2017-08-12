//
//  ImageCacheTests.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import XCTest
import Nimble
@testable import RedbubbleHomework


class ImageCacheTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCacheImageFromValidUrl() {
        
        let imageUrl = "https://ih0.redbubble.net/image.374633749.7195/flat,800x800,075,t.u4.jpg"
        var img: UIImage? = nil
        
        ImageCache.shared.loadImage(withUrl: imageUrl) { result in
            switch result {
            case .success(let image):
                img = image
            case .failure(_):
                break
            }
        }
        
        expect(img).toEventuallyNot(beNil())
        expect(ImageCache.shared.cache.object(forKey: imageUrl as NSString)).notTo(beNil())
    }
    
    func testCacheImageFromInvalidUrl() {
        
        let imageUrl = "https://ih0.redbubble.net/image"
        var img: UIImage? = nil
        
        ImageCache.shared.loadImage(withUrl: imageUrl) { result in
            switch result {
            case .success(let image):
                img = image
            case .failure(_):
                break
            }
        }
        
        expect(img).toEventually(beNil())
    }
}
