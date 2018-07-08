//
//  Meal.swift
//  EatFit
//
//  Created by micromanc3r on 27/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

struct Meal: Codable {
    static let componentsCount = 6

    let type: MealType

    var cereal: Cereal
    var protein: Protein
    var fruit: Fruit
    var vegetable: Vegetable
    var dairy: Dairy
    var fat: Fat

    var components: [MealComponent] {
        get { return [cereal, protein, fruit, vegetable, dairy, fat] }
        set {
            cereal.quantity = newValue[0].quantity
            protein.quantity = newValue[1].quantity
            fruit.quantity = newValue[2].quantity
            vegetable.quantity = newValue[3].quantity
            dairy.quantity = newValue[4].quantity
            fat.quantity = newValue[5].quantity
        }
    }

    init(_ type: MealType) {
        cereal = Cereal()
        protein = Protein()
        fruit = Fruit()
        vegetable = Vegetable()
        dairy = Dairy()
        fat = Fat()

        self.type = type
    }
}
