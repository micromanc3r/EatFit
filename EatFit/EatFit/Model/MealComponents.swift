//
//  MealComponents.swift
//  EatFit
//
//  Created by micromanc3r on 24/06/2018.
//  Copyright © 2018 micromanc3r. All rights reserved.
//

import Foundation

protocol MealComponent {
    var quantity: Int { get }
}

struct Cereal: MealComponent {
    var quantity: Int
}

struct Fruit: MealComponent {
    var quantity: Int
}

struct Vegetable: MealComponent {
    var quantity: Int
}

struct Dairy: MealComponent {
    var quantity: Int
}

struct Protein: MealComponent {
    var quantity: Int
}

struct Fat: MealComponent {
    var quantity: Int
}
