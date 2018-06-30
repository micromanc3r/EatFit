//
//  MealPlan.swift
//  EatFit
//
//  Created by micromanc3r on 01/07/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation
import MicroLogger

class MealPlan {
    let mealCount: Int
    let meals: [Meal]

    init(mealCount: Int?) {
        self.mealCount = mealCount ?? 0

        if mealCount == 3 {
            meals = [
                Meal("Breakfast"),
                Meal("Lunch"),
                Meal("Dinner1")
            ]
        } else if mealCount == 4 {
            meals = [
                Meal("Breakfast"),
                Meal("Snack1"),
                Meal("Lunch"),
                Meal("Dinner1")
            ]
        } else if mealCount == 5 {
            meals = [
                Meal("Breakfast"),
                Meal("Snack1"),
                Meal("Lunch"),
                Meal("Snack2"),
                Meal("Dinner1")
            ]
        } else if mealCount == 6 {
            meals = [
                Meal("Breakfast"),
                Meal("Snack1"),
                Meal("Lunch"),
                Meal("Snack2"),
                Meal("Dinner1"),
                Meal("Dinner2")
            ]
        } else {
            MLogger.logError(sender: MealPlan.self,
                             andMessage: "Invalid meal count.")
            meals = [Meal]()
        }
    }
}
