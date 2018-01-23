//
//  CategoryEntry.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 19/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryEntry: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
