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
    let settingsStorage: MealSettingsStorage

    init(withWindow window: UIWindow, andStorage storage: MealSettingsStorage) {
        self.window = window
        settingsStorage = storage

        let mealCount = storage.loadMealsPerDay()

        let mealCountVC = MealCountViewController()
        mealCountVC.delegate = self
        navigationController.pushViewController(mealCountVC,
                                                animated: false)

        if mealCount != nil {
            pushComponentRatioVC()
        }
    }

    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func pushComponentRatioVC() {
        let componentRatioVC = ComponentRatioViewController()
        componentRatioVC.delegate = self
        componentRatioVC.plan = MealPlan(mealCount: settingsStorage.loadMealsPerDay())
        navigationController.pushViewController(componentRatioVC,
                                                animated: false)
    }
}

extension MainCoordinator: MealCountDelegate {
    func mealCountSelected(count: Int) {
        MLogger.logVerbose(sender: self,
                           andMessage: "Selected meal count: \(count)")

        settingsStorage.store(mealsPerDay: count)

        pushComponentRatioVC()
    }

    func defaultMealCount() -> Int? {
        return settingsStorage.loadMealsPerDay()
    }
}

extension MainCoordinator: ComponentRatioDelegate {
}
