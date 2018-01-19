//
//  ProjectsTableViewController.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 18/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit
import RealmSwift
class ProjectsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        APIClient.projects(success: { projects in
//            print(projects)
//        }) { error in
//
//        }
//        let results = DataRepository().allProjects()
//        print(results.count)
//
//        DataRepository().deleteAll()
//        print(results)
        
        DataRepository().updateData {
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
        return DataRepository().projectsCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProjectCell.identifier, for: indexPath) as! ProjectCell
        let result = DataRepository().project(indexPath: indexPath)
        cell.nameLabel.text = "Project: \(result.name)"
        return cell
    }
}
