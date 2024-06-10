//
//  ActivityHabit.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

class ActivityHabit: ObservableObject {
    // 평소에 얼마나 움직이나요? : 매우 적은 수준, 가벼운 수준, 일반적인 수준, 매우 많은 수준
    @Published var usualActivity: String
    // 하루에 얼마나 걷나요?
    @Published var dailyStep: String
    // 무릎대고 푸쉬업을 몇 개 할 수 있나요? : 10개 이하, 11~20개, 21개 이상, 잘모르겠어요
    @Published var pushUpCount: String
    // 규칙적 운동여부 : 처음이에요, 3개월 이내, 3-6개월, 6-12개월, 1년 이상
    @Published var isRegularActivity: String?
    // 규칙적으로 하는 운동은? : 헬스, 홈트, 크로스핏/HIIT/복싱, 필라테스/요가, 빠르게 걷기, 달리기, 실내 사이클/야외 자전거, 수영
    @Published var regularActivity: String?
    // 일주일에 보통 며칠? : 1일, 2일, ..., 7일
    @Published var regularActivityCount: String?
    // 하루 몇 시간 운동? pickerview
    @Published var activityTimePerDay: String?
    // 운동량 변화 : 유지할 예정, 늘릴 예정, 줄일 예정
    @Published var changeActivity: String?
    
    init(usualActivity: String, dailyStep: String, pushUpCount: String, isRegularActivity: String? = nil, regularActivity: String? = nil, regularActivityCount: String? = nil, activityTimePerDay: String? = nil, changeActivity: String? = nil) {
        self.usualActivity = usualActivity
        self.dailyStep = dailyStep
        self.pushUpCount = pushUpCount
        self.isRegularActivity = isRegularActivity
        self.regularActivity = regularActivity
        self.regularActivityCount = regularActivityCount
        self.activityTimePerDay = activityTimePerDay
        self.changeActivity = changeActivity
    }
}
