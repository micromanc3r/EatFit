//
//  MealSelectorView.swift
//  EatFit
//
//  Created by micromanc3r on 11/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import MicroLogger
import UIKit

protocol MealSelectableView where Self: UIView {
    var delegate: MealSelectorDelegate? { get set }
    var mealButtons: [UIButton] { get }
    func prepareLayout(forMealPlan plan: MealPlan)
}

class BasicMealSelectorView: UIView, MealSelectableView {
    weak var delegate: MealSelectorDelegate?
    var mealButtons = [UIButton]()

    func prepareLayout(forMealPlan plan: MealPlan) {
        var previousButton: UIButton?

        for meal in plan.meals {
            let mealButton = UIButton(frame: .zero)
            mealButton.addTarget(self, action: #selector(didSelect(mealButton:)), for: .touchUpInside)
            mealButton.setTitleColor(.black, for: .normal)
            mealButton.setTitleColor(.red, for: .selected)
            mealButton.setTitle("\(meal.type.rawValue.first ?? "-")", for: .normal)

            mealButtons.append(mealButton)
            addSubview(mealButton)
            constrain(mealButton) { mealButton in
                mealButton.height == 32
                mealButton.width == 32
            }

            if let previousButton = previousButton {
                constrain(mealButton, previousButton) { mealButton, previousButton in
                    mealButton.left == previousButton.right + 8
                    mealButton.top == previousButton.top
                }
            } else {
                constrain(mealButton) { firstButton in
                    firstButton.top == firstButton.superview!.top
                    firstButton.left == firstButton.superview!.left
                    firstButton.bottom == firstButton.superview!.bottom
                }
            }

            previousButton = mealButton
        }

        constrain(previousButton!) { lastButton in
            lastButton.top == lastButton.superview!.top
            lastButton.right == lastButton.superview!.right
            lastButton.bottom == lastButton.superview!.bottom
        }
    }

    private func selectButton(withIndex selected: Int) {
        for index in 0 ..< mealButtons.count {
            if index == selected {
                mealButtons[index].isSelected = true
            } else {
                mealButtons[index].isSelected = false
            }
        }
    }

    @objc func didSelect(mealButton: UIButton) {
        let mealIndex = mealButtons.firstIndex(of: mealButton)!
        selectButton(withIndex: mealIndex)
        delegate?.didSelect(meal: mealIndex)
    }
}
