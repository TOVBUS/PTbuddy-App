//
//  ActivityRoutine.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation

struct ActivityRoutine: Codable {
    var engTitle: String
    var korTitle: String
    var count: String?
    var set: String?
    var weight: Int?
    var time: Int?

    enum CodingKeys: String, CodingKey {
        case engTitle = "영어 운동 타이틀"
        case korTitle = "한글 이름 타이틀"
        case count = "횟수"
        case set = "세트"
        case weight = "무게(kg)"
        case time = "시간(초)"
    }
}

struct ActivityWeeklyRoutine: Codable {
    var day: String
    var activityType: String
    var activityRoutine: [ActivityRoutine]

    enum CodingKeys: String, CodingKey {
        case day = "요일"
        case activityType = "훈련 종류"
        case activityRoutine = "운동"
    }
}

//struct ActivityWeeklyRoutineRoot: Codable {
//    var success: Bool
//    var responses: [ActivityWeeklyRoutine]
//    var message: String
//}

struct ActivityRoutineRoot: Codable {
    var success: Bool
    var responses: [String]
    var message: String
}

