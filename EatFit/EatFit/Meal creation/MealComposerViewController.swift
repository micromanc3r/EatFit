//
//  MealComposerViewController.swift
//  EatFit
//
//  Created by micromanc3r on 12/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import UIKit

class MealComposerViewController: NIViewController {
    var meal: Meal
    weak var delegate: MealComposerDelegate?

    init(withMeal meal: Meal) {
        self.meal = meal
        super.init()
    }
}

class NIViewController: UIViewController {
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("Unavailable")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
}

class Test {
    func testfunc() {
        _ = MealComposerViewController(withMeal: Meal(.breakfast))
    }
}
