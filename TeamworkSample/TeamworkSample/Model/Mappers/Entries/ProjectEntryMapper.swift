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
        entry.id = input.id
        if let name = input.name,
            let description = input.description,
            let logo = input.logo,
            let status = input.status {
                entry.name = name
                entry.desc = description
                entry.logo = logo
                entry.status = status
        }
        entry.category = CategoryEntryMapper.map(input: input.category)
        entry.company = CompanyEntryMapper.map(input: input.company)
        return entry
    }

}
