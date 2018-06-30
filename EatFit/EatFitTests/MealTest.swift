//
//  MealTest.swift
//  EatFitTests
//
//  Created by micromanc3r on 30/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

@testable import EatFit
import XCTest

class MealTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testMealInit() {
        let meal = Meal()

        XCTAssertNotNil(meal)
        XCTAssertNotNil(meal.cereal)
        XCTAssertNotNil(meal.vegetable)
        XCTAssertNotNil(meal.fruit)
        XCTAssertNotNil(meal.protein)
        XCTAssertNotNil(meal.fat)
        XCTAssertNotNil(meal.dairy)
        XCTAssertNotNil(meal.components)

        XCTAssertEqual(meal.cereal.quantity, 0)
        XCTAssertEqual(meal.vegetable.quantity, 0)
        XCTAssertEqual(meal.fruit.quantity, 0)
        XCTAssertEqual(meal.protein.quantity, 0)
        XCTAssertEqual(meal.fat.quantity, 0)
        XCTAssertEqual(meal.dairy.quantity, 0)
    }

    func testMealEdit() {
        var meal = Meal()

        meal.cereal.quantity = 4
        meal.vegetable.quantity = 4
        meal.fruit.quantity = 4
        meal.protein.quantity = 4
        meal.fat.quantity = 4
        meal.dairy.quantity = 4

        XCTAssertEqual(meal.cereal.quantity, 4)
        XCTAssertEqual(meal.vegetable.quantity, 4)
        XCTAssertEqual(meal.fruit.quantity, 4)
        XCTAssertEqual(meal.protein.quantity, 4)
        XCTAssertEqual(meal.fat.quantity, 4)
        XCTAssertEqual(meal.dairy.quantity, 4)
    }
}
