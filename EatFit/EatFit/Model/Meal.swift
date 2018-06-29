//
//  Meal.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

struct Meal {
    let cereal: Cereal
    let protein: Protein
    let fruit: Fruit
    let vegetable: Vegetable
    let dairy: Dairy
    let fat: Fat

    var components: [MealComponent] {
        return [cereal, protein, fruit, vegetable, dairy, fat]
    }
}
