//
//  RSWork+Realm.swift
//  RedbubbleHomework
//
//  Created by Tingting Wen on 11/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

extension RSWork {
    class func items(with filter: String? = nil,
                     artist: String? = nil,
                     withUpdateNotificationBlock block: ((RealmCollectionChange<Results<RSWork>>) -> Void)?)
        -> (Results<RSWork>, NotificationToken?) {
        let realm = RealmManager.shared.realm ?? RealmManager.shared.newRealm()
        var results = realm.objects(RSWork.self)

        results = results.sorted(byKeyPath: "_order")
        let notificationToken = block != nil ? results.addNotificationBlock(block!) : nil
        return (results, notificationToken)
    }
}
