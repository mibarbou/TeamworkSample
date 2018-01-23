//
//  ProjectDetailPresenter.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 21/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import Foundation

protocol ProjectDetailView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func loadActivity(list: [Activity])
}

class ProjectDetailPresenter {
    private let projectService: ProjectService
    weak private var projectDetailView : ProjectDetailView?
    
    init(projectService: ProjectService){
        self.projectService = projectService
    }
    
    func attachView(view: ProjectDetailView){
        projectDetailView = view
    }
    
    func detachView() {
        projectDetailView = nil
    }
    
    func getProjectActivity(id: String) {
        let activityList = projectService.projectActivity(id: id)
        projectDetailView?.loadActivity(list: activityList)
    }
    
    func reloadTableViewDataNotification(projectId: String) {
        projectService.reloadData {
            self.getProjectActivity(id: projectId)
        }
    }
}
