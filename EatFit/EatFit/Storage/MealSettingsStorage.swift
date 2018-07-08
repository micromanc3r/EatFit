//
//  MealSettingsStorage.swift
//  EatFit
//
//  Created by micromanc3r on 30/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

protocol MealSettingsStorage {
    func store(mealsPerDay: Int)
    // returns nil if not yet stored, number of meals otherwise
    func loadMealsPerDay() -> Int?

    func store(mealPlan: MealPlan)
    func loadMealPlan() -> MealPlan?
    func loadOrCreateMealPlan() -> MealPlan
}
