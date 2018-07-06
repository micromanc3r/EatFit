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

class ComponentRatioViewController: UIViewController {
    weak var delegate: ComponentRatioDelegate?
    var plan: MealPlan?
    var mealButtons = [UIButton]()
    let viewModel = ComponentRatioViewModel()

    private let pickerView = ComponentRatioPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        generateLayout()
    }

    @objc func didSelect(meal: UIButton) {
        viewModel.selectedMeal = mealButtons.index(of: meal)!
    }
}

extension ComponentRatioViewController {
    func generateLayout() {
        title = R.string.localizable.cr_title()
        view.backgroundColor = .white

        setupRatioPicker()
        setupMealSelector()

        if mealButtons.first == nil {
            MLogger.logError(sender: self,
                             andMessage: "First button missing")
        }
        if mealButtons.last == nil {
            MLogger.logError(sender: self,
                             andMessage: "Last button missing")
        }

        constrain(pickerView, mealButtons.first!, mealButtons.last!) { pickerView, firstButton, lastButton in
            pickerView.center == pickerView.superview!.center

            firstButton.top == firstButton.superview!.safeAreaLayoutGuide.top + 16
            firstButton.left == firstButton.superview!.safeAreaLayoutGuide.left + 16

            lastButton.right <= lastButton.superview!.right - 16
        }
    }

    private func setupMealSelector() {
        if plan == nil {
            MLogger.logError(sender: self,
                             andMessage: "Meal plan is nil!")
        }

        var previousButton: UIButton?

        for meal in plan!.meals {
            let mealButton = UIButton(frame: .zero)
            mealButton.addTarget(self,
                                 action: #selector(didSelect(meal:)),
                                 for: .touchUpInside)
            mealButton.setTitleColor(.black,
                                     for: .normal)
            mealButton.setTitle("\(meal.name.first ?? "-")",
                                for: .normal)

            mealButtons.append(mealButton)
            view.addSubview(mealButton)
            constrain(mealButton) { mealButton in
                mealButton.height == 32
                mealButton.width == 32
            }

            if let previousButton = previousButton {
                constrain(mealButton, previousButton) { mealButton, previousButton in
                    mealButton.left == previousButton.right + 8
                    mealButton.top == previousButton.top
                }
            }

            previousButton = mealButton
        }
    }

    private func setupRatioPicker() {
        view.addSubview(pickerView)
    }
}
