//
//  ProjectsPresenter.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

protocol ProjectsView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setProjects(projects: [ProjectViewData])
}

class ProjectsPresenter {
    private let projectService: ProjectService
    weak private var projectsView : ProjectsView?
    
    init(projectService: ProjectService){
        self.projectService = projectService
    }
    
    func attachView(view: ProjectsView){
        projectsView = view
    }
    
    func detachView() {
        projectsView = nil
    }
    
    func getProjects(status: ProjectStatus = .all) {
        let projects = projectService.fetchProjects(status: status)
        let projectsViewModel = projects.map{ ProjectViewDataMapper.map(input: $0) }
        projectsView?.setProjects(projects: projectsViewModel)
    }
    
    func reloadTableViewDataNotification(reload: @escaping ()->()) {
        projectService.reloadData {
            self.getProjects()
            reload()
        }
    }
}















