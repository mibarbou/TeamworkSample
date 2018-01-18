//
//  CategoryResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct CategoryResponse: JSONDecodable {
    let id:     String?
    let name:   String?
    let color:  String?
    
    init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.color = "color" <~~ json
    }
}
