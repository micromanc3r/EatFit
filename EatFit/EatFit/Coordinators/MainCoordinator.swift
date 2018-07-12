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
    }

    func start() {
        if settingsStorage.mealPlanSetupFinished() {
            startMainFlow()
        } else {
            startSetupFlow()
        }
        window.makeKeyAndVisible()
    }

    func startSetupFlow() {
        let mealCount = settingsStorage.loadMealsPerDay()
        let mealCountVC = MealCountViewController()
        mealCountVC.delegate = self
        navigationController.pushViewController(mealCountVC,
                                                animated: false)

        if mealCount != nil {
            pushComponentRatioVC()
        }

        window.rootViewController = navigationController
    }

    func startMainFlow() {
        window.rootViewController = SelectMealViewController()
    }

    func pushComponentRatioVC() {
        let componentRatioVC = ComponentRatioViewController()
        componentRatioVC.delegate = self
        componentRatioVC.plan = settingsStorage.loadOrCreateMealPlan()
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
    func updated(meal: Meal) {
        guard let plan = settingsStorage.loadMealPlan() else {
            MLogger.logWarning(sender: self,
                               andMessage: "No meal plan found.")
            return
        }

        plan.update(meal)
        settingsStorage.store(mealPlan: plan)

        if let crVC = navigationController.topViewController as? ComponentRatioViewController {
            crVC.plan = plan
        }
    }

    func componentsSetupFinished() {
        MLogger.logVerbose(sender: self,
                           andMessage: "Components setup finished.")
        let setupOkVC = SetupOkViewController()
        setupOkVC.delegate = self
        navigationController.pushViewController(setupOkVC,
                                                animated: true)
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

extension MainCoordinator: SetupOkDelegate {
    func canContinue() {
        settingsStorage.store(mealPlanSetupFinished: true)

        let selectMealVc = SelectMealViewController()
        selectMealVc.delegate = self
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: {
                              self.window.rootViewController = selectMealVc
                          },
                          completion: nil)
    }
}

extension MainCoordinator: SelectMealDelegate {
    func selected(meal: Meal) {
        MLogger.logVerbose(sender: self,
                           andMessage: "Meal selected: \(meal.type.rawValue)")
    }
}
