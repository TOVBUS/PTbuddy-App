//
//  OnboardingViewModel.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var activityRoutine: ResponseActivityRoutine?
    private var cancellables = Set<AnyCancellable>()

    func fetchActivityRoutine() {
        let onboardingMemberInfo = OnboardingMemberInfo(
            basicInfo: BasicInfo(nick: "토브", gender: "여성", birth: "19981118", height: "160", weight: "50"),
            eatingHabit: EatingHabit(mealCount: "0.5인분", mealAmout: "하루 한 번 정도", carbohydratePerMealCount: "하루 한 번 정도", proteinPerMealCount: "하루 한 번 정도", vegetablePerMealCount: "하루 한 번 정도", waterIntakePerDay: "500ml 미만", alcoholIntake: "거의 먹지 않음"),
            activityHabit: ActivityHabit(usualActivity: "매우 적은 수준", dailyStep: "5,000보", pushUpCount: "21개 이상", isRegularActivity: "3-6개월", regularActivity: "헬스", regularActivityCount: "3일", activityTimePerDay: "1시간", changeActivity: "늘릴 예정"),
            activityGoal: ActivityGoal(goalWeight: "43kg", activityGoal: "근육 증가", activityPlace: "헬스장", preferenceActivity: "기구 운동", activityFrequency: "3일")
        )

        OnboardingService.shared.getActivityRoutine(onboardingMemberInfo)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.activityRoutine = response
            })
            .store(in: &cancellables)
    }
}
