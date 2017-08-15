//
//  RSArtist+Realm.swift
//  RedbubbleHomework
//
//  Created by Zoe on 11/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

extension RSArtist {
    class func items(with keyword: String? = nil,
                     withUpdateNotificationBlock block: ((RealmCollectionChange<Results<RSArtist>>) -> Void)?)
        -> (Results<RSArtist>, NotificationToken?) {
            
            
            let realm = RealmManager.shared.realm ?? RealmManager.shared.newRealm()
            var results = realm.objects(RSArtist.self)
            
            if let keyword = keyword {
                let predicate = NSPredicate(format: "name CONTAINS %@", keyword)
                results = results.filter(predicate)
            }
            
            let notificationToken = block != nil ? results.addNotificationBlock(block!) : nil
            return (results, notificationToken)
    }
}
