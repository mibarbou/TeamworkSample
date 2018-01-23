//
//  ApiResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct ApiResponse: JSONDecodable {
    let status: String
    
    init?(json: JSON) {
        guard let status: String = "STATUS" <~~ json else { return nil }
        self.status = status
    }
}
