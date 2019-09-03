//
//  MealPlan.swift
//  EatFit
//
//  Created by micromanc3r on 01/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation
import MicroLogger

class MealPlan: Codable {
    let mealCount: Int
    var meals: [Meal]

    init(forMealCount mealCount: Int?) {
        self.mealCount = mealCount ?? 0

        if mealCount == 3 {
            meals = [
                Meal(.breakfast),
                Meal(.lunch),
                Meal(.dinner1)
            ]
        } else if mealCount == 4 {
            meals = [
                Meal(.breakfast),
                Meal(.snack1),
                Meal(.lunch),
                Meal(.dinner1)
            ]
        } else if mealCount == 5 {
            meals = [
                Meal(.breakfast),
                Meal(.snack1),
                Meal(.lunch),
                Meal(.snack2),
                Meal(.dinner1)
            ]
        } else if mealCount == 6 {
            meals = [
                Meal(.breakfast),
                Meal(.snack1),
                Meal(.lunch),
                Meal(.snack2),
                Meal(.dinner1),
                Meal(.dinner2)
            ]
        } else {
            MLogger.logError(sender: MealPlan.self, andMessage: "Invalid meal count.")
            meals = [Meal]()
        }
    }
}

extension MealPlan {
    func update(_ updatedMeal: Meal) {
        for index in 0 ..< meals.count where meals[index].type == updatedMeal.type {
            meals[index] = updatedMeal
        }
    }
}
