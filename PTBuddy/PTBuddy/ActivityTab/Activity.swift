//
//  Activity.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import Foundation

struct Activity: Decodable, Identifiable {
    let id: String
    let activityTitle: String
    let proTip: String?
    let howTo: String?
    let primaryMusc: String?
    let muscleImage: String?
    let equipment: String?
    let videoURL: String?
}

struct Routine: Decodable, Identifiable {
    let id: String
    let day: String
    let exerciseArea: String
    let exerciseNameEN: String
    let exerciseNameKR: String
    let reps: String?
    let sets: String?
    let weight: String?
    let duration: String?
}

struct RoutineResponse: Decodable {
    let success: Bool
    let responses: String
    let message: String
}
