//
//  ComponentRatioView.swift
//  EatFit
//
//  Created by micromanc3r on 28/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import UIKit

// MARK: - Lifecycle

class ComponentRatioPickerView: UIView {
    let picker = UIPickerView()
    let pickerModel = ComponentRatioPickerViewModel()

    weak var delegate: ComponentRatioPickerViewDelegate? {
        didSet {
            pickerModel.delegate = delegate
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        prepareLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        prepareLayout()
    }
}

// MARK: - UI Setup

extension ComponentRatioPickerView {
    func prepareLayout() {
        setupPicker()

        constrain(picker) { picker in
            picker.left == picker.superview!.left
            picker.right == picker.superview!.right
            picker.bottom == picker.superview!.bottom
            picker.top == picker.superview!.top
        }
    }

    private func setupPicker() {
        picker.dataSource = pickerModel
        picker.delegate = pickerModel
        addSubview(picker)
    }
}

// MARK: - API

extension ComponentRatioPickerView {
    func updatePicker(withMealPlan plan: MealPlan, forPosition position: Int) {
        let meal = plan.meals[position]
        pickerModel.currentMeal = meal

        for index in 0 ..< meal.components.count {
            picker.selectRow(meal.components[index].quantity, inComponent: index, animated: true)
        }
    }
}

// MARK: - ComponentRatioPickerViewDelegate

protocol ComponentRatioPickerViewDelegate: AnyObject {
    func updated(meal: Meal)
}
