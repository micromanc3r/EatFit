//
//  MealComponents.swift
//  EatFitTests
//
//  Created by Miroslav Sliacky on 13/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

@testable import EatFit
import XCTest

class MealComponents: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testProtein() {
        let protein = Protein(quantity: 5)

        XCTAssertNotNil(protein)
        XCTAssertEqual(protein.quantity, 5)
    }

    func testCereal() {
        let cereal = Cereal(quantity: 5)

        XCTAssertNotNil(cereal)
        XCTAssertEqual(cereal.quantity, 5)
    }

    func testFruit() {
        let fruit = Fruit(quantity: 5)

        XCTAssertNotNil(fruit)
        XCTAssertEqual(fruit.quantity, 5)
    }

    func testVegetable() {
        let vegetable = Vegetable(quantity: 5)

        XCTAssertNotNil(vegetable)
        XCTAssertEqual(vegetable.quantity, 5)
    }

    func testFat() {
        let fat = Fat(quantity: 5)

        XCTAssertNotNil(fat)
        XCTAssertEqual(fat.quantity, 5)
    }

    func testDairy() {
        let dairy = Dairy(quantity: 5)

        XCTAssertNotNil(dairy)
        XCTAssertEqual(dairy.quantity, 5)
    }
}
