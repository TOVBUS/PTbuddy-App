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
    @Published var activityWeeklyRoutine: ActivityWeeklyRoutine?
    private var cancellables = Set<AnyCancellable>()

    func fetchActivityRoutine() {
        let onboardingMemberInfo = OnboardingMemberInfo(
            basicInfo: BasicInfo(nick: "토브", gender: "여성", birth: "19981118", height: "160", weight: "50"),
            eatingHabit: EatingHabit(mealCount: "0.5인분", mealAmout: "하루 한 번 정도", carbohydratePerMealCount: "하루 한 번 정도", proteinPerMealCount: "하루 한 번 정도", vegetablePerMealCount: "하루 한 번 정도", waterIntakePerDay: "500ml 미만", alcoholIntake: "거의 먹지 않음"),
            activityHabit: ActivityHabit(usualActivity: "매우 적은 수준", dailyStep: "5,000보", pushUpCount: "10개 이하", isRegularActivity: "3-6개월", regularActivity: "헬스", regularActivityCount: "3일", activityTimePerDay: "1시간", changeActivity: "늘릴 예정"),
            activityGoal: ActivityGoal(goalWeight: "43kg", activityGoal: "근육 증가", activityPlace: "헬스장", preferenceActivity: "맨몸 운동", activityFrequency: "3일")
        )

        var request = URLRequest(url: URL(string: "http://localhost:3001/ai/activity-routine")!)
                request.timeoutInterval = 180



        OnboardingService.shared.getActivityRoutine(onboardingMemberInfo)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] (activityRoutineRoot: ActivityRoutineRoot) in
                do {
                    
                    let data = try JSONEncoder().encode(activityRoutineRoot)

//                    activityWeeklyRoutine = try JSONDecoder().decode(ActivityWeeklyRoutine.self, from: self.data)

                    
                } catch {
                    print(error.localizedDescription)
                }
            })
            .store(in: &cancellables)
    }
}

