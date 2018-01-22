//
//  ProjectMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ProjectMapper: Mapper {
    typealias IN = ProjectEntry
    typealias OUT = Project
    
    static func map(input: ProjectEntry) -> Project {
        return Project(id: input.id,
                       name: input.name,
                       description: input.desc,
                       category: CategoryMapper.map(input: input.category),
                       company: CompanyMapper.map(input: input.company),
                       logo: URL(string: input.logo),
                       status: input.status,
                       createdOn: UtilDates.date(from: input.createdOn),
                       startDate: UtilDates.date(timestampString: input.startDate),
                       endDate: UtilDates.date(timestampString: input.endDate))
    }

}
