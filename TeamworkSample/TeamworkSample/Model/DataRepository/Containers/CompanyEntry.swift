//
//  CompanyEntry.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 19/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import RealmSwift

class CompanyEntry: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var isOwner: Bool = false
    
    convenience init(company: Company) {
        self.init()
        id = company.id
        name = company.name
        isOwner = company.isOwner
    }
}
