//
//  Container.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import RealmSwift

final public class ProjectContainer {
    
    fileprivate let container: Realm
    fileprivate var notificationToken: NotificationToken? = nil
    
    init() {
        self.container = try! Realm()
        self.container.autorefresh = true
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func getProjects() -> Results<ProjectEntry> {
        return self.container.objects(ProjectEntry.self)
    }
    
    func getProject(index: Int) -> ProjectEntry {
        return getProjects()[index]
    }
    
    func projectsCount() -> Int {
        return getProjects().count
    }
    
    func save(projects: [ProjectEntry]) {
        try! container.write {
            container.add(projects, update: true)
        }
    }
    
    func deleteAll() {
        try! container.write {
            container.deleteAll()
        }
    }
    
    func subscribeToUpdatedData(callback: @escaping ()->()) {
        self.notificationToken = container.observe({ (not, realm) in
            callback()
        })
    }
}

