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
    }
}
