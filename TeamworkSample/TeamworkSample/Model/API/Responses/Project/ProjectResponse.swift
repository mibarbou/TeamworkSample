//
//  ProjectResponse.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Gloss

struct ProjectResponse: JSONDecodable {
    let id:                             String
    let company:                        CompanyResponse?
    let starred:                        Bool?
    let name:                           String?
    let showAnnouncement:               Bool?
    let announcement:                   String?
    let description:                    String?
    let status:                         String?
    let isProjectAdmin:                 Bool?
    let createdOn:                      String?
    let category:                       CategoryResponse?
    let startPage:                      String?
    let logo:                           String?
    let startDate:                      String?
    let notifyEveryone:                 Bool?
    let lastChangedOn:                  String?
    let endDate:                        String?
    let harvestTimersEnabled:           Bool?
    
    init?(json: JSON) {
        guard let id: String = "id" <~~ json else {
            return nil
        }
        self.id = id
        self.company = "company" <~~ json
        self.starred = "starred" <~~ json
        self.name = "name" <~~ json
        self.showAnnouncement = "show-announcement" <~~ json
        self.announcement = "announcement" <~~ json
        self.description = "description" <~~ json
        self.status = "status" <~~ json
        self.isProjectAdmin = "isProjectAdmin" <~~ json
        self.createdOn = "created-on" <~~ json
        self.category = "category" <~~ json
        self.startPage = "start-page" <~~ json
        self.logo = "logo" <~~ json
        self.startDate = "startDate" <~~ json
        self.notifyEveryone = "notifyeveryone" <~~ json
        self.lastChangedOn = "last-changed-on" <~~ json
        self.endDate = "endDate" <~~ json
        self.harvestTimersEnabled = "harvest-timers-enabled" <~~ json
    }
}
