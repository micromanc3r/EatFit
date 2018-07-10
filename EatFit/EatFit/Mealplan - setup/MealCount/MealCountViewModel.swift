//
//  MealCountViewModel.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit

class MealCountViewModel: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in _: UIPickerView) -> Int {
        return MealCount.mealPlans
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return MealCount.maxMeals - MealCount.minMeals + 1 // 6 - 3 (+1) = (3,)4,5,6
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return "\(row + MealCount.minMeals)"
    }

    // MARK: - MealCountViewModel

    func row(fromMealCount count: Int?) -> Int {
        return (count ?? MealCount.minMeals) - MealCount.minMeals
    }
}
