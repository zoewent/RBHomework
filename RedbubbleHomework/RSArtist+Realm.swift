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
    class func items(with keyword: String? = nil,
                     withUpdateNotificationBlock block: ((RealmCollectionChange<Results<RSArtist>>) -> Void)?)
        -> (Results<RSArtist>, NotificationToken?) {
            
            let realm = RealmManager.shared.realm ?? RealmManager.shared.newRealm()
            var results = realm.objects(RSArtist.self)
            
//            if let keyword = keyword {
//                var filtered = results.filter { artist in
//                    artist.name.contains(keyword)
//                }
//                
//                return (filtered, notificationToken)
//            }

            
            let notificationToken = block != nil ? results.addNotificationBlock(block!) : nil
            return (results, notificationToken)
    }
}
