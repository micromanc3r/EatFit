//
//  DefaultMealSettingsStorage.swift
//  EatFit
//
//  Created by micromanc3r on 30/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation
import MicroLogger

class DefaultMealSettingsStorage: MealSettingsStorage {
    let defaults = UserDefaults.standard

    func store(mealsPerDay: Int) {
        MLogger.logVerbose(sender: self, andMessage: "Storing meals per day: \(mealsPerDay)")
        defaults.set(mealsPerDay, forKey: Key.mealsPerDay)
    }

    func loadMealsPerDay() -> Int? {
        let mealsPerDay = defaults.integer(forKey: Key.mealsPerDay)
        MLogger.logVerbose(sender: self, andMessage: "Loading meals per day: \(mealsPerDay)")

        guard mealsPerDay != 0 else {
            return nil
        }

        return mealsPerDay
    }

    func store(mealPlan: MealPlan) {
        MLogger.logVerbose(sender: self, andMessage: "Storing meal plan.")
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(mealPlan) {
            defaults.set(encoded, forKey: Key.mealPlan)
        } else {
            MLogger.logWarning(sender: self, andMessage: "Meal plan not stored, could not be encoded.")
        }
    }

    func loadMealPlan() -> MealPlan? {
        MLogger.logVerbose(sender: self, andMessage: "Loading meal plan.")

        if let mealPlanData = defaults.object(forKey: Key.mealPlan) as? Data {
            let decoder = JSONDecoder()
            if let mealPlan = try? decoder.decode(MealPlan.self, from: mealPlanData) {
                return mealPlan
            }
        }

        MLogger.logWarning(sender: self, andMessage: "No meal plan found.")
        return nil
    }

    func loadOrCreateMealPlan() -> MealPlan {
        let mealCount = loadMealsPerDay()
        if let oldPlan = loadMealPlan(), oldPlan.mealCount == mealCount {
            return oldPlan
        }

        let newPlan = MealPlan(forMealCount: mealCount)
        store(mealPlan: newPlan)
        return newPlan
    }

    func store(mealPlanSetupFinished: Bool) {
        MLogger.logVerbose(sender: self, andMessage: "Storing setup finished.")

        defaults.set(mealPlanSetupFinished,
                     forKey: Key.setupFinished)
    }

    func mealPlanSetupFinished() -> Bool {
        MLogger.logVerbose(sender: self, andMessage: "Loading setup finished.")
        return defaults.bool(forKey: Key.setupFinished)
    }
}

struct Key {
    static let mealsPerDay = "eatfit.mealsPerDay"
    static let mealPlan = "eatfit.mealplan"
    static let setupFinished = "eatfit.setupFinished"

    private init() {}
}
