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
    
    init() {
        self.container = try! Realm()
        self.container.autorefresh = true
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
        return self.container.objects(CompanyEntry.self)
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

