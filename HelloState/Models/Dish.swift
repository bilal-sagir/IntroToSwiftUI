//
//  Dish.swift
//  HelloState
//
//  Created by Bilal on 2.04.2022.
//

import Foundation

struct Dish: Identifiable {
    
    let id = UUID()
    let name: String
    let imageURL: String
    let isSpicy: Bool

}

extension Dish{
    
    static func all() -> [Dish]{
        
        return [
            Dish(name: "Kung Pow Chicken", imageURL: "kungpow", isSpicy: true),
            Dish(name: "Sweet and Sour Chicken", imageURL: "sweet", isSpicy: false),
            Dish(name: "Spicy Red Chicken", imageURL: "spicy", isSpicy: true)
        ]
    }
}
