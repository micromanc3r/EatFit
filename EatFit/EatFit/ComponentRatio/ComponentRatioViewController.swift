//
//  ComponentRatioViewController.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Cartography
import UIKit

class ComponentRatioViewController: UIViewController {
    weak var delegate: ComponentRatioDelegate?
    var plan: MealPlan?

    private let pickerView = ComponentRatioView()

    override func viewDidLoad() {
        super.viewDidLoad()

        generateLayout()
    }
}

extension ComponentRatioViewController {
    func generateLayout() {
        title = R.string.localizable.cr_title()
        view.backgroundColor = .cyan

        setupRatioPicker()

        constrain(pickerView) { pickerView in
            pickerView.center == pickerView.superview!.center
        }
    }
}

extension ComponentRatioViewController {
    func setupMealSelector() {
    }
}

extension ComponentRatioViewController {
    func setupRatioPicker() {
        view.addSubview(pickerView)
    }
}
