//
//  MainCoordinator.swift
//  EatFit
//
//  Created by micromanc3r on 26/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    let window: UIWindow
    let navigationController = UINavigationController()

    init(withWindow window: UIWindow) {
        self.window = window

        navigationController.pushViewController(ViewController(),
                                                animated: false)
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
