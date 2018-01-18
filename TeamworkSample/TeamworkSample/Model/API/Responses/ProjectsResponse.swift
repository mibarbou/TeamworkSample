//
//  ProjectsResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct ProjectsResponse: JSONDecodable {
    let projects:   [ProjectResponse]?
    init?(json: JSON) {
        guard let projectsJSON: [JSON] = "projects" <~~ json else {
            self.projects = [ProjectResponse]()
            return
        }
        self.projects = [ProjectResponse].from(jsonArray: projectsJSON)
    }
}
