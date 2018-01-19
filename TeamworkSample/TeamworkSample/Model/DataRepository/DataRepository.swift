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
    func allProjects() -> Results<ProjectEntry>
    func deleteAll()
    func projectsCount() -> Int
    func project(indexPath: IndexPath) -> ProjectEntry
    func updateData(reload: @escaping ()->())
}

class DataRepository: Containable {
    fileprivate lazy var container: Realm = { return try! Realm() }()
    
    fileprivate lazy var projects: Results<ProjectEntry> = {
        let result = allProjects()
        result.observe({ (changes) in
            
        })
        return allProjects()
    }()
    
    
    func allProjects() -> Results<ProjectEntry> {
        APIClient.projects(success: { response in
            let projects = ProjectsMapper.map(input: response)
            self.save(projects: projects)
        }) { (error) in
        }
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
        let _ = allProjects()._observe { (_) in
            reload()
        }
    }
    
    
    fileprivate func save(projects: [Project]) {
        let projectsEntries = projects.map{ ProjectEntry(project: $0) }
        try! container.write {
            container.deleteAll()
            container.add(projectsEntries)
        }
    }
    
 
}
