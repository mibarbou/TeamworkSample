//
//  ProjectEntry.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 19/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import RealmSwift

class ProjectEntry: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var category: CategoryEntry?
    @objc dynamic var company: CompanyEntry?
    @objc dynamic var logo: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}