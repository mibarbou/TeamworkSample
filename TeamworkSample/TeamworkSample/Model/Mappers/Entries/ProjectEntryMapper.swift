//
//  ProjectMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ProjectEntryMapper: Mapper {
    typealias IN = ProjectResponse
    typealias OUT = ProjectEntry
    
    static func map(input: ProjectResponse) -> ProjectEntry {
        let entry = ProjectEntry()
        if let id = input.id,
            let name = input.name,
            let description = input.description,
            let logo = input.logo {
                entry.id = id
                entry.name = name
                entry.desc = description
                entry.logo = logo
        }
        entry.category = CategoryEntryMapper.map(input: input.category)
        entry.company = CompanyEntryMapper.map(input: input.company)
        return entry
    }

}
