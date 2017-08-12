//
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

class RSProduct: Object {
    dynamic var id: String = ""
    dynamic var workId: String = ""
    dynamic var productType: String = ""
    dynamic var imageUrl: String = ""
    dynamic var isSaved: Bool = false

    convenience init(id: String, workId: String, productType: String, isSaved: Bool, url: String) {
        self.init()
        self.id = id
        self.workId = workId
        self.productType = productType
        self.imageUrl = url
        self.isSaved = isSaved
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}

class RSWork: Object {
    dynamic var id: String = ""
    dynamic var title: String = ""
    dynamic var imageUrl: String = ""
    dynamic var artistName: String = ""
    dynamic var isSaved: Bool = false

    convenience init(id: String, title: String, artistName: String, isSaved: Bool, url: String) {
        self.init()
        self.id = id
        self.title = title
        self.imageUrl = url
        self.artistName = artistName
        self.isSaved = isSaved
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}

class RSArtist: Object {
    dynamic var name: String = ""
    dynamic var avatarImageUrl: String = ""
    dynamic var isSaved: Bool = false

    convenience init(name: String, isSaved: Bool, avatarImageUrl: String) {
        self.init()
        self.name = name
        self.avatarImageUrl = avatarImageUrl
        self.isSaved = isSaved
    }
}
