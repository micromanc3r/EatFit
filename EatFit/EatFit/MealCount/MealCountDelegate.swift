//
//  MealCountDelegate.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

protocol MealCountDelegate: class {
    func mealCountSelected(count: Int)
    func defaultMealCount() -> Int?
}
