//
//  MealPlanModel.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/12/24.
//

import SwiftData
import Foundation

@Model
final class MealPlan {
    var id = UUID()
    var day: String
    var breakfast: String
    var lunch: String
    var dinner: String

    init(day: String, breakfast: String, lunch: String, dinner: String) {
        self.day = day
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }
}

struct MealPlanResponse: Codable {
    var success: Bool
    var responses: [String]
    var message: String
}




