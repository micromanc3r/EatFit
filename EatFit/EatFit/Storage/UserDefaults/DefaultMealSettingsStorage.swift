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
    func store(mealsPerDay: Int) {
        MLogger.logVerbose(sender: self,
                           andMessage: "Storing meals per day: \(mealsPerDay)")
        UserDefaults.standard.set(mealsPerDay,
                                  forKey: Key.mealsPerDay)
    }

    func loadMealsPerDay() -> Int? {
        let mealsPerDay = UserDefaults.standard.integer(forKey: Key.mealsPerDay)
        MLogger.logVerbose(sender: self,
                           andMessage: "Loading meals per day: \(mealsPerDay)")

        guard mealsPerDay != 0 else {
            return nil
        }

        return mealsPerDay
    }
}

struct Key {
    static let mealsPerDay = "eatfit.mealsPerDay"

    private init() {}
}
