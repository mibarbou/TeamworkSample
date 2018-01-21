//
//  ActivityMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ActivityMapper: Mapper {
    typealias IN = ActivityEntry
    typealias OUT = Activity
    
    static func map(input: ActivityEntry) -> Activity {
        return Activity(id: input.id,
                        itemId: input.itemId,
                        todoListName: input.todoListName,
                        fromUserAvatarUrl: URL(string: input.fromUserAvatarUrl),
                        description: input.desc,
                        publicInfo: input.publicInfo,
                        fromUsername: input.fromUsername,
                        forUserAvatarUrl: URL(string: input.forUserAvatarUrl),
                        forUsername: input.forUsername,
                        dateTime: input.dateTime,
                        dueDate: input.dueDate,
                        projectId: input.projectId)
    }
}
