//
//  ImageDownloaderTests.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import XCTest
import Nimble
@testable import RedbubbleHomework

class ImageDownloaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidUrl() {
        let imageUrl = "https://ih0.redbubble.net/image.374633749.7195/flat,800x800,075,t.u4.jpg"
        
        var image: UIImage? = nil
        ImageDownloader.shared.getDataFromUrl(url: imageUrl) { (data, _, error) in
            
            guard error == nil else {
                fail("Image download error")
                return
            }
            
            guard let data = data else {
                fail("Cant load image data")
                return
            }
            
            image = UIImage(data: data)
        }
        
        expect(image).toEventuallyNot(beNil())
    }
    
    func testInvalidUrl() {
        let imageUrl = "https:"
        
        ImageDownloader.shared.getDataFromUrl(url: imageUrl) { (data, _, error) in
            
            expect(error).toNot(beNil())
        }
        
    }
}
