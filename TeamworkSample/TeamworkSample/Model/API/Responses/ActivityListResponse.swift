//
//  ActivitiesResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct ActivityListResponse: JSONDecodable {
    let activities: [ActivityResponse]?
    init?(json: JSON) {
        guard let activitiesJSON: [JSON] = "activity" <~~ json else {
            self.activities = [ActivityResponse]()
            return
        }
        self.activities = [ActivityResponse].from(jsonArray: activitiesJSON)
    }
}
