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
    fileprivate var status: ProjectStatus = .all
    
    init(name: String) {
        var config = Realm.Configuration()
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(name).realm")
        // Set this as the configuration used for the default Realm
        Realm.Configuration.defaultConfiguration = config
        self.container = try! Realm(configuration: config)
    }
    
    init(testName: String) {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = testName
        self.container = try! Realm()
    }
    
    deinit {
        notificationToken?.invalidate()
    }
    
    func getProjects(status: ProjectStatus = .all) -> Results<ProjectEntry> {
        self.status = status
        switch status {
        case .all:
            return self.container.objects(ProjectEntry.self)
        case .active:
            return self.container.objects(ProjectEntry.self).filter("status = 'active'")
        case .archived:
            return self.container.objects(ProjectEntry.self).filter("status = 'archived'")
        default:
            return self.container.objects(ProjectEntry.self)
        }
    }
    
    func getProject(index: Int) -> ProjectEntry {
        return getProjects(status: self.status)[index]
    }
    
    func projectsCount() -> Int {
        return getProjects(status: self.status).count
    }
    
    func getCompanies() -> Results<CompanyEntry> {
        return self.container.objects(CompanyEntry.self).sorted(byKeyPath: "name")
    }
    
    func companiesCount() -> Int {
        return getCompanies().count
    }
    
    func companyNameAt(index: Int) -> String {
        let category = getCompanies()[index]
        let projects = getProjects(status: self.status).filter("company.id == %@", category.id)
        if projects.count > 0 {
            return category.name
        }
        return ""
    }
    
    func projectsCountAt(index: Int) -> Int {
        let categoryId = getCompanies()[index].id
        let projects = getProjects(status: self.status).filter("company.id == %@", categoryId)
        return projects.count
    }
    
    func projectAt(indexPath: IndexPath) -> ProjectEntry {
        let categoryId = getCompanies()[indexPath.section].id
        let projects = getProjects(status: self.status).filter("company.id == %@", categoryId)
        let project = projects[indexPath.row]
        return project
    }
    
    func save(projects: [ProjectEntry]) {
        try! container.write {
            container.add(projects, update: true)
        }
    }
    
    func saveProjectActivity(id: String, activity: [ActivityEntry]) {
        if let project = container.object(ofType: ProjectEntry.self, forPrimaryKey: id) {
            try! container.write {
                project.activity.append(objectsIn: activity)
                container.add(project, update: true)
            }
        }
    }
    
    func deleteProjectActivity(id: String) {
        if let project = container.object(ofType: ProjectEntry.self, forPrimaryKey: id) {
            try! container.write {
                container.delete(project.activity)
            }
        }
    }
    
    func getProjectActivity(id: String) -> List<ActivityEntry>  {
        guard let activity = container.object(ofType: ProjectEntry.self,
                                              forPrimaryKey: id)?.activity else {
            return List<ActivityEntry>()
        }
        return activity
    }
    
    func deleteAll() {
        try! container.write {
            container.deleteAll()
        }
    }
    
    func subscribeToUpdatedData(callback: @escaping ()->()) {
        self.notificationToken = container.observe({ (notif, realm) in
            callback()
        })
    }
}

