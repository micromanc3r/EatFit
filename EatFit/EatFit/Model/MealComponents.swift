//
//  MealComponents.swift
//  EatFit
//
//  Created by micromanc3r on 24/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

protocol MealComponent: Codable {
    var quantity: Int { get set }
}

struct Cereal: MealComponent {
    var quantity: Int = 0
}

struct Fruit: MealComponent {
    var quantity: Int = 0
}

struct Vegetable: MealComponent {
    var quantity: Int = 0
}

struct Dairy: MealComponent {
    var quantity: Int = 0
}

struct Protein: MealComponent {
    var quantity: Int = 0
}

struct Fat: MealComponent {
    var quantity: Int = 0
}
