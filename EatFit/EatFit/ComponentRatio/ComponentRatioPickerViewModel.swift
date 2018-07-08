//
//  ComponentPickerViewModel.swift
//  EatFit
//
//  Created by micromanc3r on 30/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import MicroLogger
import UIKit

class ComponentRatioPickerViewModel: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    weak var delegate: ComponentRatioPickerViewDelegate?
    var currentMeal: Meal?

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in _: UIPickerView) -> Int {
        return Meal.componentsCount
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return 11
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return "\(Double(row) * 0.5)"
    }

    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard currentMeal != nil else {
            MLogger.logWarning(sender: self,
                               andMessage: "No current meal set - cannot update.")
            return
        }

        currentMeal!.components[component].quantity = row
        delegate?.updated(meal: currentMeal!)
    }
}
