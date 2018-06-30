//
//  Meal.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

struct Meal {
    static let componentsCount = 6

    var cereal: Cereal
    var protein: Protein
    var fruit: Fruit
    var vegetable: Vegetable
    var dairy: Dairy
    var fat: Fat

    var components: [MealComponent] {
        return [cereal, protein, fruit, vegetable, dairy, fat]
    }

    init() {
        cereal = Cereal()
        protein = Protein()
        fruit = Fruit()
        vegetable = Vegetable()
        dairy = Dairy()
        fat = Fat()
    }
}
