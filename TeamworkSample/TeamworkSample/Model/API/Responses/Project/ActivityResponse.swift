//
//  ActivityResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct ActivityResponse: JSONDecodable {
    let id:                             String
    let itemId:                         String?
    let todoListName:                   String?
    let fromUserAvatarUrl:              String?
    let description:                    String?
    let forUsername:                    String?
    let publicInfo:                     String?
    let projectId:                      String?
    let forUserId:                      String?
    let itemLink:                       String?
    let dateTime:                       String?
    let activityType:                   String?
    let latestActivityType:             String?
    let link:                           String?
    let extraDescription:               String?
    let isPrivate:                      String?
    let dueDate:                        String?
    let lockdownId:                     String?
    let fromUsername:                   String?
    let type:                           String?
    let forUserAvatarUrl:               String?
    let userId:                         String?
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json else {
            return nil
        }
        self.id = id
        self.itemId = "itemid" <~~ json
        self.todoListName = "todo-list-name" <~~ json
        self.fromUserAvatarUrl = "todo-list-name" <~~ json
        self.description = "description" <~~ json
        self.forUsername = "forusername" <~~ json
        self.publicInfo = "publicinfo" <~~ json
        self.projectId = "projectId" <~~ json
        self.forUserId = "foruserid" <~~ json
        self.itemLink = "itemlink" <~~ json
        self.dateTime = "datetime" <~~ json
        self.activityType = "activitytype" <~~ json
        self.latestActivityType = "latestActivityType" <~~ json
        self.link = "link" <~~ json
        self.extraDescription = "extradescription" <~~ json
        self.isPrivate = "isprivate" <~~ json
        self.dueDate = "due-date" <~~ json
        self.lockdownId = "lockdownId" <~~ json
        self.fromUsername = "fromusername" <~~ json
        self.type = "type" <~~ json
        self.forUserAvatarUrl = "for-user-avatar-url" <~~ json
        self.userId = "userid" <~~ json
    }
}

