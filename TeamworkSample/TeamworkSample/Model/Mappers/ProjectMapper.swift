//
//  ProjectMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ProjectMapper: Mapper {
    typealias IN = ProjectResponse
    typealias OUT = Project
    
    static func map(input: ProjectResponse) -> Project {
        return Project(id: input.id ?? "",
                       name: input.name ?? "",
                       description: input.description ?? "",
                       category: CategoryMapper.map(input: input.category),
                       company: CompanyMapper.map(input: input.company),
                       logo: URL(string: input.logo ?? ""))
    }
}
