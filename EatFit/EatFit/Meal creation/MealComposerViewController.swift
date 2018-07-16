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
