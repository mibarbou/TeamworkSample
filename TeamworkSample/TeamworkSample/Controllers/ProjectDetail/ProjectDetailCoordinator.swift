//
//  ProjectDetailCoordinator.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit

final class ProjectDetailCoordinator: Coordinator {
    
    private let project: ProjectViewData
    private unowned let navigationController: UINavigationController
    
    init(project: ProjectViewData, navigationController: UINavigationController) {
        self.project = project
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController = ProjectDetailViewController(project: project)
        navigationController.pushViewController(viewController, animated: true)
    }
}
