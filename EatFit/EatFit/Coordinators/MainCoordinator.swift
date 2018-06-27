//
//  MainCoordinator.swift
//  EatFit
//
//  Created by micromanc3r on 26/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import MicroLogger
import UIKit

class MainCoordinator: Coordinator {
    let window: UIWindow
    let navigationController = UINavigationController()

    init(withWindow window: UIWindow) {
        self.window = window

        let mealCountVC = MealCountViewController()
        mealCountVC.delegate = self
        navigationController.pushViewController(mealCountVC,
                                                animated: false)
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension MainCoordinator: MealCountDelegate {
    func mealCountSelected(count: Int) {
        MLogger.logVerbose(sender: self,
                           andMessage: "Selected meal count: \(count)")

        UserDefaults().set(count, forKey: "meal_count")

        let componentRatioVC = ComponentRatioViewController()
        componentRatioVC.delegate = self
        navigationController.pushViewController(componentRatioVC,
                                                animated: true)
    }
}

extension MainCoordinator: ComponentRatioDelegate {
}
