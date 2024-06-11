//
//  ActivityGoal.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

class ActivityGoal: ObservableObject, Codable {
    // 목표 몸무게는 어떻게 되시나요?
    @Published var goalWeight: String
    // 주요 목표는 무엇인가요? : 근육 증가, 체지방 감소, 현재 상태 유지
    @Published var activityGoal: String
    // 주로 어디서 운동하나요? : 헬스장, 집
    @Published var activityPlace: String
    // 어떤 운동을 선호하나요? : 맨몸 운동, 기구 운동
    @Published var preferenceActivity: String
    // 일주일에 몇 번 운동하실 예정인가요?
    @Published var activityFrequency: String

    enum CodingKeys: String, CodingKey {
        case goalWeight, activityGoal, activityPlace, preferenceActivity, activityFrequency
    }

    init(goalWeight: String, activityGoal: String, activityPlace: String, preferenceActivity: String, activityFrequency: String) {
        self.goalWeight = goalWeight
        self.activityGoal = activityGoal
        self.activityPlace = activityPlace
        self.preferenceActivity = preferenceActivity
        self.activityFrequency = activityFrequency
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        goalWeight = try container.decode(String.self, forKey: .goalWeight)
        activityGoal = try container.decode(String.self, forKey: .activityGoal)
        activityPlace = try container.decode(String.self, forKey: .activityPlace)
        preferenceActivity = try container.decode(String.self, forKey: .preferenceActivity)
        activityFrequency = try container.decode(String.self, forKey: .activityFrequency)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(goalWeight, forKey: .goalWeight)
        try container.encode(activityGoal, forKey: .activityGoal)
        try container.encode(activityPlace, forKey: .activityPlace)
        try container.encode(preferenceActivity, forKey: .preferenceActivity)
        try container.encode(activityFrequency, forKey: .activityFrequency)
    }
}

enum Week: String, CaseIterable {
    case mon = "월"
    case tue = "화"
    case wed = "수"
    case thu = "목"
    case fri = "금"
    case sat = "토"
    case sun = "일"
}
