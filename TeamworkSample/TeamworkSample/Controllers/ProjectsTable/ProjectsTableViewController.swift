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
    var didSelectProject: (Project) -> Void = { _ in }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.attachView(view: self)
        presenter.getProjects()
        presenter.reloadTableViewDataNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        let nib = UINib(nibName: ProjectCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ProjectCell.identifier)
        tableView.rowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        addSegmentedControl()
    }
    
    func addSegmentedControl() {
        let segmentedControl = UISegmentedControl(items: ["ALL", "ACTIVE", "ARCHIVED"])
        segmentedControl.frame = CGRect(x: 0,
                                        y: 0,
                                        width: 150,
                                        height: 20)
        self.navigationItem.titleView = segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self,
                                   action: #selector(ProjectsTableViewController.changeValue(sender:)),
                                   for: .valueChanged)
    }
    
    @objc func changeValue(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            presenter.getProjects(status: .active)
        case 2:
            presenter.getProjects(status: .archived)
        default:
            presenter.getProjects()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sectionsCount()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numbersOfRowsAt(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier, for: indexPath) as! ProjectCell
        let project = presenter.projectAt(indexPath: indexPath)
        cell.configureCell(project: project)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.sectionNameAt(index: section)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = presenter.projectAt(indexPath: indexPath)
        didSelectProject(project)
    }
}

extension ProjectsTableViewController: ProjectsView {
    func loadData() {
        self.tableView.reloadData()
    }
    

    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
}





















