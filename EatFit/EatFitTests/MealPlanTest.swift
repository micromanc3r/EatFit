//
//  MealPlanTest.swift
//  EatFitTests
//
//  Created by micromanc3r on 01/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

@testable import EatFit
import XCTest

class MealPlanTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMealPlanInit() {
        var plan: MealPlan

        plan = MealPlan(forMealCount: 0)
        XCTAssertEqual(plan.meals.count, 0)
        plan = MealPlan(forMealCount: 1)
        XCTAssertEqual(plan.meals.count, 0)
        plan = MealPlan(forMealCount: 2)
        XCTAssertEqual(plan.meals.count, 0)

        plan = MealPlan(forMealCount: 3)
        XCTAssertEqual(plan.meals.count, 3)
        XCTAssertEqual(plan.meals.count, plan.mealCount)
        plan = MealPlan(forMealCount: 4)
        XCTAssertEqual(plan.meals.count, 4)
        XCTAssertEqual(plan.meals.count, plan.mealCount)
        plan = MealPlan(forMealCount: 5)
        XCTAssertEqual(plan.meals.count, 5)
        XCTAssertEqual(plan.meals.count, plan.mealCount)
        plan = MealPlan(forMealCount: 6)
        XCTAssertEqual(plan.meals.count, 6)
        XCTAssertEqual(plan.meals.count, plan.mealCount)
    }
}
