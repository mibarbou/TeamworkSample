//
//  DataRepository.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 19/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation
import RealmSwift

protocol Containable {
    func deleteAll()
    func projectsCount() -> Int
    func project(indexPath: IndexPath) -> ProjectEntry
    func updateData(reload: @escaping ()->())
    func fetchProjects() -> Results<ProjectEntry>
}

class DataRepository: Containable {
    fileprivate var container: Realm = { return try! Realm() }()
    
    fileprivate var token: NotificationToken? = nil
    
    fileprivate var projects: Results<ProjectEntry> {
        return container.objects(ProjectEntry.self)
    }
    
    deinit {
        token?.invalidate()
    }
    
    func fetchProjects() -> Results<ProjectEntry> {
        APIClient.projects(success: { response in
            if let projects = response.projects {
                self.deleteAll()
                let entries = projects.map{ ProjectEntryMapper.map(input: $0) }
                self.save(projects: entries)
            }
        }) { (error) in
        }
        return getSavedProjects()
    }
    
    func getSavedProjects() -> Results<ProjectEntry> {
        return container.objects(ProjectEntry.self)
    }
    
    func projectsCount() -> Int {
        return projects.count
    }
    
    func project(indexPath: IndexPath) -> ProjectEntry {
        return projects[indexPath.row]
    }
    
    
    func deleteAll() {
        try! container.write {
            container.deleteAll()
        }
    }
    
    func updateData(reload: @escaping ()->()) {
        token = projects.observe({ (changes) in
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                reload()
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                reload()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        })
    }
    
    fileprivate func save(projects: [ProjectEntry]) {
        try! container.write {
            container.add(projects)
        }
    }
    
 
}
