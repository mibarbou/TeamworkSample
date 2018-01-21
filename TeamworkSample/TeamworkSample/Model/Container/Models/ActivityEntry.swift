//
//  ActivityEntry.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import RealmSwift

class ActivityEntry: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var itemId: String = ""
    @objc dynamic var todoListName: String = ""
    @objc dynamic var fromUserAvatarUrl: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var publicInfo: String = ""
    @objc dynamic var fromUsername: String = ""
    @objc dynamic var forUserAvatarUrl: String = ""
    @objc dynamic var forUsername: String = ""
    @objc dynamic var dateTime: String = ""
    @objc dynamic var dueDate: String = ""
    @objc dynamic var projectId: String = ""

//    override static func primaryKey() -> String? {
//        return "id"
//    }
}
