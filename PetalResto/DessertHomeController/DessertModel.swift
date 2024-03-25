//
//  DessertModel.swift
//  PetalResto
//
//  Created by Rajat Nagavkar on 5/16/22.
//

import Foundation
import UIKit

struct Meal: Codable {
    let meals: [Meals]
}

struct Meals: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
