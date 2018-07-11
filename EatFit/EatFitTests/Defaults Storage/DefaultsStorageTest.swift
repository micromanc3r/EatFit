//
//  DefaultsStorageTest.swift
//  EatFitTests
//
//  Created by micromanc3r on 30/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

@testable import EatFit
import XCTest

class DefaultsStorageTest: XCTestCase {
    let storage = DefaultMealSettingsStorage()

    private func cleanStorage() {
        UserDefaults.standard.removeObject(forKey: Key.mealsPerDay)
        UserDefaults.standard.removeObject(forKey: Key.mealPlan)
        UserDefaults.standard.removeObject(forKey: Key.setupFinished)
    }

    override func setUp() {
        super.setUp()
        cleanStorage()
    }

    override func tearDown() {
        super.tearDown()
        cleanStorage()
    }

    func testMealCountNilBeforeStore() {
        XCTAssertNil(storage.loadMealsPerDay())
    }

    func testMealCount() {
        let mealCount = 3
        storage.store(mealsPerDay: mealCount)

        XCTAssertNotNil(storage.loadMealsPerDay())
        XCTAssertEqual(mealCount,
                       storage.loadMealsPerDay()!)
    }

    func testMealPlanNilBeforeStore() {
        XCTAssertNil(storage.loadMealPlan())
    }

    func testMealPlan() {
        let plan = MealPlan(forMealCount: 5)
        storage.store(mealPlan: plan)

        let loadedPlan = storage.loadMealPlan()
        XCTAssertNotNil(loadedPlan)
        XCTAssertEqual(5,
                       loadedPlan?.mealCount)
    }

    func testSetupFinishedBeforeStore() {
        XCTAssertFalse(storage.mealPlanSetupFinished())
    }

    func testSetupFinished() {
        storage.store(mealPlanSetupFinished: false)
        XCTAssertFalse(storage.mealPlanSetupFinished())

        storage.store(mealPlanSetupFinished: true)
        XCTAssertTrue(storage.mealPlanSetupFinished())
    }
}
