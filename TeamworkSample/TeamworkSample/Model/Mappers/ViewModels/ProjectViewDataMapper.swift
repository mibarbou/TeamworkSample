//
//  ProjectViewDataMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ProjectViewDataMapper: Mapper {
    typealias IN = Project
    typealias OUT = ProjectViewData
    
    static func map(input: Project) -> ProjectViewData {
        return ProjectViewData(id: input.id,
                               name: input.name,
                               description: input.description,
                               category: input.category?.name ?? "",
                               company: input.company?.name ?? "")
    }
}
