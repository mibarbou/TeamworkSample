//
//  CompanyResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct CompanyResponse: JSONDecodable {
    let id:         String?
    let name:       String?
    let isOwner:    String?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.isOwner = "is-owner" <~~ json
    }
}
