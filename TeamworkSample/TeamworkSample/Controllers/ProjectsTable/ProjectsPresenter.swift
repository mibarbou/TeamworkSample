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
    func loadData()
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
        let _ = projectService.fetchProjects(status: status)
        projectsView?.loadData()
    }
    
    func sectionsCount() -> Int {
       return projectService.companiesCount()
    }
    
    func numbersOfRowsAt(section: Int) -> Int {
        return projectService.projectsCountAt(index: section)
    }

    func projectAt(indexPath: IndexPath) -> Project {
        return projectService.projectAt(indexPath: indexPath)
    }
    
    func sectionNameAt(index: Int) -> String {
        return projectService.companyNameAt(index: index)
    }
    
    func reloadTableViewDataNotification() {
        projectService.reloadData {
            self.getProjects()
        }
    }
}















