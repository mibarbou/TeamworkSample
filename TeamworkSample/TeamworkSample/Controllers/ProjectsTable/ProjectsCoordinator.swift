//
//  ProjectsCoordinator.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit

final class ProjectsCoordinator: Coordinator {
    private unowned let navigationController: UINavigationController
    private let viewController: ProjectsTableViewController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        viewController = ProjectsTableViewController()
        
        super.init()
        
        // Present the detail when the user selects a project
        viewController.didSelectProject = { [weak self] project in
            guard let `self` = self else {
                return
            }

            let coordinator = ProjectDetailCoordinator(project: project, navigationController: navigationController)
            self.add(child: coordinator)
            coordinator.start()
        }
    }
    
    override func start() {
        viewController.definesPresentationContext = true
        navigationController.pushViewController(viewController, animated: false)
    }
}
