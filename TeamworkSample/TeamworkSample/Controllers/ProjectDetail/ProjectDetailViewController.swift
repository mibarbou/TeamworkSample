//
//  ProjectDetailViewController.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let presenter = ProjectDetailPresenter(projectService: ProjectService())
    let project: Project
    
    var activityList = [Activity]()
    
    init(project: Project) {
        self.project = project
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.attachView(view: self)
        presenter.getProjectActivity(id: project.id)
        presenter.reloadTableViewDataNotification(projectId: project.id)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        self.title = project.name
        let nib = UINib(nibName: ActivityCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ActivityCell.identifier)
    }
}


extension ProjectDetailViewController: ProjectDetailView {
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func loadActivity(list: [Activity]) {
        self.activityList = list
        self.tableView.reloadData()
    }
}

extension ProjectDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCell.identifier, for: indexPath) as! ActivityCell
        let activity = self.activityList[indexPath.row]
        cell.descriptionLabel.text = activity.id
        return cell
    }
}






