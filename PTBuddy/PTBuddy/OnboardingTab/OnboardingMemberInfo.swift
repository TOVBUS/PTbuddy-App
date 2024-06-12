//
//  OnboardingMemberInfo.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

class OnboardingMemberInfo: ObservableObject, Codable {
    @Published var basicInfo: BasicInfo
    @Published var eatingHabit: EatingHabit
    @Published var activityHabit: ActivityHabit
    @Published var activityGoal: ActivityGoal

    enum CodingKeys: String, CodingKey {
        case basicInfo, eatingHabit, activityHabit, activityGoal
    }

    init(basicInfo: BasicInfo, eatingHabit: EatingHabit, activityHabit: ActivityHabit, activityGoal: ActivityGoal) {
        self.basicInfo = basicInfo
        self.eatingHabit = eatingHabit
        self.activityHabit = activityHabit
        self.activityGoal = activityGoal
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        basicInfo = try container.decode(BasicInfo.self, forKey: .basicInfo)
        eatingHabit = try container.decode(EatingHabit.self, forKey: .eatingHabit)
        activityHabit = try container.decode(ActivityHabit.self, forKey: .activityHabit)
        activityGoal = try container.decode(ActivityGoal.self, forKey: .activityGoal)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(basicInfo, forKey: .basicInfo)
        try container.encode(eatingHabit, forKey: .eatingHabit)
        try container.encode(activityHabit, forKey: .activityHabit)
        try container.encode(activityGoal, forKey: .activityGoal)
    }
}

