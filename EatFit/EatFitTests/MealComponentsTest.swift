//
//  MealComponentsTest.swift
//  EatFitTests
//
//  Created by Miroslav Sliacky on 13/03/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

@testable import EatFit
import XCTest

class MealComponentsTest: XCTestCase {
    func testProtein() {
        let protein = Protein(quantity: 5)

        XCTAssertNotNil(protein)
        XCTAssertEqual(protein.quantity, 5)
    }

    func testProteinNoParams() {
        let protein = Protein()

        XCTAssertNotNil(protein)
        XCTAssertEqual(protein.quantity, 0)
    }

    func testCereal() {
        let cereal = Cereal(quantity: 5)

        XCTAssertNotNil(cereal)
        XCTAssertEqual(cereal.quantity, 5)
    }

    func testCerealNoParams() {
        let cereal = Cereal()

        XCTAssertNotNil(cereal)
        XCTAssertEqual(cereal.quantity, 0)
    }

    func testFruit() {
        let fruit = Fruit(quantity: 5)

        XCTAssertNotNil(fruit)
        XCTAssertEqual(fruit.quantity, 5)
    }

    func testFruitNoParams() {
        let fruit = Fruit()

        XCTAssertNotNil(fruit)
        XCTAssertEqual(fruit.quantity, 0)
    }

    func testVegetable() {
        let vegetable = Vegetable(quantity: 5)

        XCTAssertNotNil(vegetable)
        XCTAssertEqual(vegetable.quantity, 5)
    }

    func testVegetableNoParams() {
        let vegetable = Vegetable()

        XCTAssertNotNil(vegetable)
        XCTAssertEqual(vegetable.quantity, 0)
    }

    func testFat() {
        let fat = Fat(quantity: 5)

        XCTAssertNotNil(fat)
        XCTAssertEqual(fat.quantity, 5)
    }

    func testFatNoParams() {
        let fat = Fat()

        XCTAssertNotNil(fat)
        XCTAssertEqual(fat.quantity, 0)
    }

    func testDairy() {
        let dairy = Dairy(quantity: 5)

        XCTAssertNotNil(dairy)
        XCTAssertEqual(dairy.quantity, 5)
    }

    func testDairyNoParams() {
        let dairy = Dairy()

        XCTAssertNotNil(dairy)
        XCTAssertEqual(dairy.quantity, 0)
    }
}
