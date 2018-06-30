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
    }

    override func setUp() {
        super.setUp()
        cleanStorage()
    }

    override func tearDown() {
        super.tearDown()
        cleanStorage()
    }

    func testMealCountNilBeforeSetup() {
        XCTAssertNil(storage.loadMealsPerDay())
    }

    func testMealCount() {
        let mealCount = 3
        storage.store(mealsPerDay: mealCount)

        XCTAssertNotNil(storage.loadMealsPerDay())
        XCTAssertEqual(mealCount,
                       storage.loadMealsPerDay()!)
    }
}
