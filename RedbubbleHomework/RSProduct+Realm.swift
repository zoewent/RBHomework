//
//  RSProduct+Realm.swift
//  RedbubbleHomework
//
//  Created by Zoe on 11/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

extension RSProduct {
    class func items(withWorkId workId: String? = nil,
                     productType: String? = nil,
                     withUpdateNotificationBlock block: ((RealmCollectionChange<Results<RSProduct>>) -> Void)?)
        -> (Results<RSProduct>, NotificationToken?) {
            
            let realm = RealmManager.shared.realm ?? RealmManager.shared.newRealm()
            var results = realm.objects(RSProduct.self)
            
            if let workId = workId {
                let predicate = NSPredicate(format: "workId = %@", workId)
                results = results.filter(predicate)
            }
            
            if let productType = productType {
                let predicate = NSPredicate(format: "productType = %@", productType)
                results = results.filter(predicate)
            }
            
        let notificationToken = block != nil ? results.addNotificationBlock(block!) : nil
        return (results, notificationToken)
    }
}
