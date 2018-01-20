//
//  ProjectsTableViewController.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UITableViewController {
    
    private let presenter = ProjectsPresenter(projectService: ProjectService())
    private var projectsToDisplay = [ProjectViewData]()
    var didSelectProject: (ProjectViewData) -> Void = { _ in }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.attachView(view: self)
        presenter.getProjects()
        presenter.reloadTableViewDataNotification {
            self.tableView.reloadData()
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        self.title = "Projects"
        let nib = UINib(nibName: ProjectCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ProjectCell.identifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsToDisplay.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier, for: indexPath) as! ProjectCell
        let project = projectsToDisplay[indexPath.row]
        cell.configureCell(project: project)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projectsToDisplay[indexPath.row]
        didSelectProject(project)
    }
}

extension ProjectsTableViewController: ProjectsView {

    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func setProjects(projects: [ProjectViewData]) {
        projectsToDisplay = projects
    }    
}





















