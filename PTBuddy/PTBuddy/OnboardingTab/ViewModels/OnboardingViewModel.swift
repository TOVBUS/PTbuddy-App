//
//  OnboardingViewModel.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation
import Combine
import Alamofire

class OnboardingViewModel: ObservableObject {
    @Published var activityWeeklyRoutine: [ActivityWeeklyRoutine] = []
    @Published var rawResponse: String = ""
    @Published var errorMessage: String? = nil
    @Published var memberInfo = OnboardingMemberInfo(
        basicInfo: BasicInfo(nick: "토브", gender: "여성", birth: "19981118", height: "160", weight: "50"),
        eatingHabit: EatingHabit(mealCount: "0.5인분", mealAmout: "하루 한 번 정도", carbohydratePerMealCount: "하루 한 번 정도", proteinPerMealCount: "하루 한 번 정도", vegetablePerMealCount: "하루 한 번 정도", waterIntakePerDay: "500ml 미만", alcoholIntake: "거의 먹지 않음"),
        activityHabit: ActivityHabit(usualActivity: "매우 적은 수준", dailyStep: "5,000보", pushUpCount: "10개 이하", isRegularActivity: "3-6개월", regularActivity: "헬스", regularActivityCount: "3일", activityTimePerDay: "1시간", changeActivity: "늘릴 예정"),
        activityGoal: ActivityGoal(goalWeight: "43kg", activityGoal: "근육 증가", activityPlace: "헬스장", preferenceActivity: "맨몸 운동", activityFrequency: "3일")
    )
    private var cancellables = Set<AnyCancellable>()

    func fetchActivityRoutine() {
        OnboardingService.shared.getActivityRoutine(memberInfo)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.errorMessage = error.localizedDescription
                    }
                }
            }, receiveValue: { [weak self] (activityRoutineRoot: ActivityRoutineRoot) in
                DispatchQueue.main.async {
                    self?.rawResponse = activityRoutineRoot.responses
                }

                do {
                    let parsedRoutine = try self?.parseActivityRoutine(activityRoutineRoot.responses)
                    DispatchQueue.main.async {
                        self?.activityWeeklyRoutine = parsedRoutine ?? []
                    }
                } catch {
                    DispatchQueue.main.async {
                        self?.errorMessage = "Parsing error: \(error.localizedDescription)"
                    }
                }
            })
            .store(in: &cancellables)
    }

    private func parseActivityRoutine(_ response: String) throws -> [ActivityWeeklyRoutine] {
        var weeklyRoutine: [ActivityWeeklyRoutine] = []
        let days = response.split(separator: "|")
        var currentDay: String?
        var currentType: String?
        var activities: [ActivityRoutine] = []

        for (index, element) in days.enumerated() {
            switch index % 9 {
            case 0:
                if let currentDay = currentDay, let currentType = currentType {
                    let weeklyActivity = ActivityWeeklyRoutine(day: currentDay, activityType: currentType, activityRoutine: activities)
                    weeklyRoutine.append(weeklyActivity)
                }
                currentDay = String(element)
                activities = []
            case 1:
                currentType = String(element)
            default:
                let parts = element.split(separator: ",")
                if parts.count == 6 {
                    let activity = ActivityRoutine(
                        engTitle: String(parts[0]),
                        korTitle: String(parts[1]),
                        count: parts[2] == "null" ? nil : String(parts[2]),
                        set: parts[3] == "null" ? nil : String(parts[3]),
                        weight: parts[4] == "null" ? nil : Int(parts[4]),
                        time: parts[5] == "null" ? nil : Int(parts[5])
                    )
                    activities.append(activity)
                }
            }
        }

        if let currentDay = currentDay, let currentType = currentType {
            let weeklyActivity = ActivityWeeklyRoutine(day: currentDay, activityType: currentType, activityRoutine: activities)
            weeklyRoutine.append(weeklyActivity)
        }

        return weeklyRoutine
    }

//    func splitByDay(_ response: String) -> [String] {
//        let dayOfWeek = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]
//        var splitByDay = response.components(separatedBy: "|\(dayOfWeek[0])")
//        var dailyRoutines: [String] = []
//
//        for day in dayOfWeek {
//            if let range = splitByDay[1].range(of: day) {
//                let dayRoutine = splitByDay[1][..<range.lowerBound]
//                print(<#T##items: Any...##Any#>)
//            }
//        }
//    }
}
