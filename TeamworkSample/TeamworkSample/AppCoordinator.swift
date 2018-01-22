//
//  AppCoordinator.swift
//  TeamworkSample
//
//  Created by Michel Barbou Salvador on 20/01/2018.
//  Copyright © 2018 Michel Barbou Salvador. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        customizeAppearance()
        window.rootViewController = navigationController
        let coordinator = ProjectsCoordinator(navigationController: navigationController)
        add(child: coordinator)
        coordinator.start()
        window.makeKeyAndVisible()
    }
    
    private func customizeAppearance() {
        let navigationBarAppearance = UINavigationBar.appearance()
        let barTintColor = UIColor(named: .bar)
        let backgroundColor = UIColor(named: .background)
        
        navigationBarAppearance.barStyle = .black // This will make the status bar white by default
        navigationBarAppearance.barTintColor = barTintColor
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        UITableViewHeaderFooterView.appearance().tintColor = .lightGray
        UITableView.appearance().tintColor = backgroundColor
    }
}
