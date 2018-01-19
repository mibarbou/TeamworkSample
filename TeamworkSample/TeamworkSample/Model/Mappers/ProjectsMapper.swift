//
//  ProjectsMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ProjectsMapper: Mapper {
    typealias IN = ProjectsResponse
    typealias OUT = [Project]
    
    static func map(input: ProjectsResponse) -> [Project] {
        guard let projects = input.projects else {
            return []
        }
        return projects.map{ ProjectMapper.map(input: $0) }
    }
}
