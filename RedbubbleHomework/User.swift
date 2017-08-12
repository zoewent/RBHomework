//
//  User.swift
//  RedbubbleHomework
//
//  Created by Tingting Wen on 11/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var id: String = ""
    dynamic var username: String = ""

    convenience init(id: String, username: String) {
        self.init()
        self.id = id
        self.username = username
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    static var favouriteArtists: [RSArtist] = []
    static var favouriteArtworks: [RSWork] = []
    static var favouriteProduct: [RSProduct] = []
}
