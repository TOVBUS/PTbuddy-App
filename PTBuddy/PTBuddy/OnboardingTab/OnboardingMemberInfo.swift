//
//  OnboardingMemberInfo.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

class OnboardingMemberInfo: ObservableObject {
    @Published var basicInfo: BasicInfo
    @Published var eatingHabit: EatingHabit
    @Published var activityHabit: ActivityHabit
    @Published var activityGoal: ActivityGoal

    init(basicInfo: BasicInfo, eatingHabit: EatingHabit, activityHabit: ActivityHabit, activityGoal: ActivityGoal) {
        self.basicInfo = basicInfo
        self.eatingHabit = eatingHabit
        self.activityHabit = activityHabit
        self.activityGoal = activityGoal
    }
}

