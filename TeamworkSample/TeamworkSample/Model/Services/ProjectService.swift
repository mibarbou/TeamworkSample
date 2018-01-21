//
//  ProjectService.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

class ProjectService {
    fileprivate var isCacheData = true
    
    fileprivate lazy var projectContainer = {
        return ProjectContainer()
    }()
    
    func fetchProjects(status: ProjectStatus) -> [Project] {
        if isCacheData {
            getAllServerProjects()
        }
        let entries = projectContainer.getProjects(status: status)
        let projects = entries.map{ ProjectMapper.map(input: $0) }
        return projects.map{ $0 }
    }
    
    func projectsCount() -> Int {
        return projectContainer.projectsCount()
    }
    
    func reloadData(callback: @escaping ()->()) {
        projectContainer.subscribeToUpdatedData {
            callback()
        }
    }
    
    fileprivate func getAllServerProjects() {
        APIClient.projects(success: { response in
            if let projects = response.projects {
                self.isCacheData = false
                let entries = projects.map{ ProjectEntryMapper.map(input: $0) }
                self.projectContainer.save(projects: entries)
            }
        }) { (error) in
            
        }
    }
}
