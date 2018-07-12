//
//  SelectMealViewController.swift
//  EatFit
//
//  Created by micromanc3r on 10/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import MicroLogger
import UIKit

class SelectMealViewController: UIViewController {
    let titleLabel = UILabel()
    let mealSelector = MealSelectorView()

    weak var delegate: SelectMealDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareLayout()
    }
}

extension SelectMealViewController {
    func prepareLayout() {
        view.backgroundColor = .white

        prepareTitleLabel()
        prepareMealSelector()

        constrain(titleLabel, mealSelector) { titleLabel, mealSelector in
            titleLabel.top == titleLabel.superview!.safeAreaLayoutGuide.top + 24
            titleLabel.centerX == titleLabel.superview!.centerX
            titleLabel.left >= titleLabel.superview!.safeAreaLayoutGuide.left + 16
            titleLabel.right <= titleLabel.superview!.safeAreaLayoutGuide.right - 16

            mealSelector.top == titleLabel.bottom + 24
            mealSelector.centerX == mealSelector.superview!.centerX
            mealSelector.left >= mealSelector.superview!.safeAreaLayoutGuide.left + 16
            mealSelector.right <= mealSelector.superview!.safeAreaLayoutGuide.right - 16
        }
    }

    private func prepareTitleLabel() {
        titleLabel.text = R.string.localizable.sm_title()
        titleLabel.font = UIFont.systemFont(ofSize: 36,
                                            weight: .heavy)
        view.addSubview(titleLabel)
    }

    private func prepareMealSelector() {
        mealSelector.prepareLayout(forMealPlan: DefaultMealSettingsStorage().loadMealPlan()!)
        mealSelector.delegate = self
        view.addSubview(mealSelector)
    }
}

extension SelectMealViewController: MealSelectorDelegate {
    func didSelect(meal: Int) {
        MLogger.logVerbose(sender: self,
                           andMessage: "Selected meal: \(meal)")
    }
}
