//
//  Activity.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import Foundation

struct Activity: Decodable, Identifiable, Hashable {
    var id: String
    var activityTitle: String
    var proTip: String?
    var howTo: String?
    var primaryMusc: String?
    var muscleImage: String?
    var equipment: String?
    var videoURL: String?

    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct WeeklyRoutine: Decodable, Identifiable {
    var id = UUID()
    var day: String
    var exerciseArea: String
    var exerciseNameEN: String
    var exerciseNameKR: String
    var reps: String?
    var sets: String?
    var weight: String?
    var duration: String?
}

struct RoutineResponse: Decodable {
    let success: Bool
    let responses: String
    let message: String
}
