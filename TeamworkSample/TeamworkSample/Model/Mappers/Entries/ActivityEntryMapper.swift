//
//  ActivityEntryMapper.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

struct ActivityEntryMapper: Mapper {
    typealias IN = ActivityResponse
    typealias OUT = ActivityEntry
    
    static func map(input: ActivityResponse) -> ActivityEntry {
        let entry = ActivityEntry()
        entry.id = input.id
        if let todoListName = input.todoListName,
            let description = input.description,
            let itemId = input.itemId,
            let fromUserAvatarUrl = input.fromUserAvatarUrl,
            let publicInfo = input.publicInfo,
            let fromUsername = input.fromUsername,
            let forUserAvatarUrl = input.forUserAvatarUrl,
            let forUsername = input.forUsername,
            let dateTime = input.dateTime,
            let dueDate = input.dueDate,
            let projectId = input.projectId {
                entry.todoListName = todoListName
                entry.desc = description
                entry.itemId = itemId
                entry.fromUserAvatarUrl = fromUserAvatarUrl
                entry.publicInfo = publicInfo
                entry.fromUsername = fromUsername
                entry.forUserAvatarUrl = forUserAvatarUrl
                entry.forUsername = forUsername
                entry.dateTime = dateTime
                entry.dueDate = dueDate
                entry.projectId = projectId
        }
        return entry
    }
}
