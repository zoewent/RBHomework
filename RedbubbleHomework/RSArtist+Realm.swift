//
//  RSArtist+Realm.swift
//  RedbubbleHomework
//
//  Created by Tingting Wen on 11/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

extension RSArtist {
    class func items(for product: RSArtist,
                     hasImage: Bool? = nil,
                     isActive: Bool? = nil,
                     withUpdateNotificationBlock block: ((RealmCollectionChange<Results<RSProduct>>) -> Void)?) -> (Results<RSProduct>, NotificationToken?) {
        let realm = RealmManager.shared.realm ?? RealmManager.shared.newRealm()
        var results = realm.objects(RSProduct.self)

        results = results.sorted(byKeyPath: "_order")
        let notificationToken = block != nil ? results.addNotificationBlock(block!) : nil
        return (results, notificationToken)
    }
}
