//
//  CompanyResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct CompanyResponse: JSONDecodable {
    let id:         String
    let name:       String?
    let isOwner:    String?
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json else {
            return nil
        }
        self.id = id
        self.name = "name" <~~ json
        self.isOwner = "is-owner" <~~ json
    }
}
