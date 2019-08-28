//
//  MainCoordinatorTest.swift
//  EatFitTests
//
//  Created by micromanc3r on 25/08/2019.
//  Copyright © 2019 micromanc3r. All rights reserved.
//

@testable import EatFit
import XCTest

class MainCoordinatorTest: XCTestCase {
    func testCoordinatorStartBeforeFinishedSetup() {
        // Given
        let window = UIWindow(frame: CGRect.zero)
        let testStorage = TestSettingsStorage(setupFinished: false)
        let coordinator = MainCoordinator(withWindow: window, andStorage: testStorage)

        // When
        coordinator.start()

        // Then
        XCTAssertNotNil((coordinator.window.rootViewController as? UINavigationController)?.viewControllers.first)
        XCTAssertTrue(((coordinator.window.rootViewController as? UINavigationController)?.viewControllers.first?.isKind(of: MealCountViewController.self))!)
    }

    func testCoordinatorStartAfterFinishedSetup() {
        // Given
        let window = UIWindow(frame: CGRect.zero)
        let testStorage = TestSettingsStorage(setupFinished: true)
        let coordinator = MainCoordinator(withWindow: window, andStorage: testStorage)

        // When
        coordinator.start()

        // Then
        XCTAssertNotNil(coordinator.window.rootViewController)
        XCTAssertTrue(((coordinator.window.rootViewController as? UINavigationController)?.viewControllers.first?.isKind(of: SelectMealViewController.self))!)
    }
}

private class TestSettingsStorage: MealSettingsStorage {
    let testSetupFinished: Bool

    init(setupFinished: Bool) {
        testSetupFinished = setupFinished
    }

    func store(mealsPerDay _: Int) {}

    func loadMealsPerDay() -> Int? {
        return 3
    }

    func store(mealPlan _: MealPlan) {}

    func loadMealPlan() -> MealPlan? {
        return MealPlan(forMealCount: 3)
    }

    func loadOrCreateMealPlan() -> MealPlan {
        return MealPlan(forMealCount: 3)
    }

    func store(mealPlanSetupFinished _: Bool) {}

    func mealPlanSetupFinished() -> Bool {
        return testSetupFinished
    }
}
