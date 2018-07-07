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
}
