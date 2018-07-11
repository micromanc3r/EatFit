//
//  ComponentRatioPickerViewTest.swift
//  EatFitTests
//
//  Created by micromanc3r on 08/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

@testable import EatFit
import MicroLogger
import XCTest

class ComponentRatioPickerViewTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        let pickerView = ComponentRatioPickerView()

        XCTAssertNotNil(pickerView)
        XCTAssertNotNil(pickerView.picker)
        XCTAssertEqual(pickerView.picker, pickerView.subviews.first)
    }

    func testDelegate() {
        let pickerView = ComponentRatioPickerView()
        let delegate = TestDelegate()

        pickerView.delegate = delegate

        XCTAssertNotNil(pickerView.delegate)
        XCTAssertNotNil(pickerView.pickerModel.delegate)
    }

    func testUpdatePicker() {
        let pickerView = ComponentRatioPickerView()

        // before update
        for componentIndex in 0 ..< pickerView.picker.numberOfComponents {
            let selectedRow = pickerView.picker.selectedRow(inComponent: componentIndex)
            XCTAssertEqual(selectedRow, 0)
        }

        update(pickerView: pickerView)

        // after update
        for componentIndex in 0 ..< pickerView.picker.numberOfComponents {
            let selectedRow = pickerView.picker.selectedRow(inComponent: componentIndex)
            XCTAssertEqual(selectedRow, 1)
        }
    }

    private func update(pickerView: ComponentRatioPickerView) {
        let newPlan = MealPlan(forMealCount: 5)
        var updatedMeal = Meal(.breakfast)
        let newQuantity = 1

        updatedMeal.cereal.quantity = newQuantity
        updatedMeal.protein.quantity = newQuantity
        updatedMeal.dairy.quantity = newQuantity
        updatedMeal.fat.quantity = newQuantity
        updatedMeal.cereal.quantity = newQuantity
        updatedMeal.fruit.quantity = newQuantity
        updatedMeal.vegetable.quantity = newQuantity

        newPlan.update(updatedMeal)
        pickerView.updatePicker(withMealPlan: newPlan, forPosition: 0)
    }
}

class TestDelegate: ComponentRatioPickerViewDelegate {
    func updated(meal _: Meal) {
        print("updated delegate")
    }
}
