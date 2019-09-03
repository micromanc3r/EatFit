//
//  ComponentRatioViewController.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import MicroLogger
import UIKit

class ComponentRatioViewController: NIViewController {
    weak var delegate: ComponentRatioDelegate?
    var plan: MealPlan
    let mealSelectorView: MealSelectableView
    let viewModel = ComponentRatioViewModel()

    private let pickerView = ComponentRatioPickerView()

    init(mealSelectorView: MealSelectableView, mealPlan plan: MealPlan) {
        self.plan = plan
        self.mealSelectorView = mealSelectorView

        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLayout()
        viewModel.delegate = self
    }

    @objc func finishComponentsSetup() {
        delegate?.componentsSetupFinished()
    }
}

extension ComponentRatioViewController {
    func prepareLayout() {
        title = R.string.localizable.cr_title()
        view.backgroundColor = .white

        setupRatioPicker()
        setupMealSelector()
        setupFinishedButton()

        constrain(pickerView, mealSelectorView as UIView) { pickerView, mealSelectorView in
            pickerView.center == pickerView.superview!.center

            mealSelectorView.top == mealSelectorView.superview!.safeAreaLayoutGuide.top + 16
            mealSelectorView.left >= mealSelectorView.superview!.safeAreaLayoutGuide.left + 16
            mealSelectorView.right <= mealSelectorView.superview!.right - 16
            mealSelectorView.centerX == mealSelectorView.superview!.centerX
        }
    }

    private func setupMealSelector() {
        mealSelectorView.prepareLayout(forMealPlan: plan)
        mealSelectorView.delegate = self

        view.addSubview(mealSelectorView as UIView)
    }

    private func setupRatioPicker() {
        pickerView.delegate = delegate
        view.addSubview(pickerView)
        selected(mealIndex: 0)
    }

    private func setupFinishedButton() {
        let finishBarButtonItem = UIBarButtonItem(title: R.string.localizable.cr_finish_button(),
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(finishComponentsSetup))
        navigationItem.rightBarButtonItem = finishBarButtonItem
    }
}

extension ComponentRatioViewController: ComponentRatioViewModelDelegate {
    func selected(mealIndex: Int) {
        pickerView.updatePicker(withMealPlan: plan, forPosition: mealIndex)
    }
}

extension ComponentRatioViewController: MealSelectorDelegate {
    func didSelect(meal: Int) {
        viewModel.selectedMeal = meal
    }
}
