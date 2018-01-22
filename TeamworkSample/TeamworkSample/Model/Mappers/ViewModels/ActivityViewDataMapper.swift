//
//  ActivityViewDataMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 22/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ActivityViewDataMapper: Mapper {
    typealias IN = Activity
    typealias OUT = ActivityViewData
    
    static func map(input: Activity) -> ActivityViewData {
        return ActivityViewData(id: input.id,
                                itemId: input.itemId,
                                todoListName: input.todoListName,
                                description: input.description,
                                publicInfo: input.publicInfo,
                                fromUsername: input.fromUsername,
                                forUsername: input.forUsername,
                                dateTime: UtilDates.string(from: input.dateTime),
                                dueDate: UtilDates.string(from: input.dueDate),
                                projectId: input.projectId)
    }
}
