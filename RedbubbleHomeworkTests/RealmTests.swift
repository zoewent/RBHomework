//
//  RealmTests.swift
//  RedbubbleHomework
//
//  Created by Zoe on 12/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import XCTest
import Nimble
@testable import RedbubbleHomework

class RealmTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetArtist() {
        let artists = RealmManager.shared.realm.objects(RSArtist.self)
        expect(artists.count).to(equal(14))
        artists.forEach { artist in
            expect(artist.name.isEmpty).to(beFalse())
            expect(artist.avatarImageUrl.isEmpty).to(beFalse())
        }
    }
    
    func testGetArtwork() {
        let works = RealmManager.shared.realm.objects(RSWork.self)
        expect(works.count).to(equal(15))
        works.forEach { work in
            expect(work.id.isEmpty).to(beFalse())
            expect(work.title.isEmpty).to(beFalse())
            expect(work.imageUrl.isEmpty).to(beFalse())
            expect(work.artistName.isEmpty).to(beFalse())
        }
    }
    
    func testGetProduct() {
        let products = RealmManager.shared.realm.objects(RSProduct.self)
        expect(products.count).to(equal(17))
        products.forEach { product in
            expect(product.id.isEmpty).to(beFalse())
            expect(product.workId.isEmpty).to(beFalse())
            expect(product.productType.isEmpty).to(beFalse())
            expect(product.imageUrl.isEmpty).to(beFalse())
        }
    }
}
