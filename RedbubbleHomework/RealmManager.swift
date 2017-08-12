//
//  RealmManager.swift
//  RedbubbleHomework
//
//  Created by Tingting Wen on 11/8/17.
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    static let shared = RealmManager()
    fileprivate override init() {}

    var realm: Realm!

    var defaultConfiguration: Realm.Configuration {
        var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
        let realmDirectory = URL(fileURLWithPath: paths[0]).appendingPathComponent("Realm", isDirectory: true)
        if !FileManager.default.fileExists(atPath: realmDirectory.path) {
            do {
                try FileManager.default.createDirectory(at: realmDirectory,
                                                        withIntermediateDirectories: false,
                                                        attributes: nil)
            } catch let e as NSError {
                print(e.localizedDescription)
            }
        }
        let defaultFileUrl = realmDirectory.appendingPathComponent("default.realm")
        print(defaultFileUrl)
        return Realm.Configuration(fileURL: defaultFileUrl)
    }

    func initialiseRealm() {
        guard Thread.isMainThread else {
            fatalError("initialiseRealm() must be executed on the main thread")
        }
        // Check if there is a logged in user

        // If no logged in user, set default config
        Realm.Configuration.defaultConfiguration = defaultConfiguration

        do {
            realm = try Realm()
        } catch let e as NSError {
            fatalError("Unable to initialise default Realm: \(e.localizedDescription)")
        }
    }

    func newRealm() -> Realm {
        return try! Realm()
    }

    func newInMemoryRealmWithIdentifier(_ identifier: String) -> Realm {
        return try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: identifier))
    }
}
