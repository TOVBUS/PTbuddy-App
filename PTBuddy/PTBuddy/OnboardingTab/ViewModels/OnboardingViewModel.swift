//
//  OnboardingViewModel.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation
import Combine
import Alamofire

@MainActor
class OnboardingViewModel: ObservableObject {
    @Published var activityWeeklyRoutine: [WeeklyRoutine] = []
    @Published var rawResponse: String = ""
    @Published var errorMessage: String? = nil
    @Published var memberInfo = OnboardingMemberInfo()
    private var cancellables = Set<AnyCancellable>()

    func fetchActivityRoutine(completionHandler: @escaping () -> Void) {
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
            }, receiveValue: { [weak self] (routineResponse: RoutineResponse) in
                self?.parseResponse(response: routineResponse.responses)
            })
            .store(in: &cancellables)
    }

    private func parseResponse(response: String) {
        let lines = response.components(separatedBy: "||")

        for line in lines {
            let fields = line.components(separatedBy: "|")
            var day = ""
            var exerciseArea = ""
            var exerciseNameEN = ""
            var exerciseNameKR = ""
            var reps: String? = nil
            var sets: String? = nil
            var weight: String? = nil
            var duration: String? = nil

            for field in fields {
                let pair = field.components(separatedBy: ":")
                if pair.count == 2 {
                    let key = pair[0]
                    let value = pair[1]

                    switch key {
                        case "요일":
                            day = value
                        case "부위":
                            exerciseArea = value
                        case "이름(영어)":
                            exerciseNameEN = value
                        case "이름(한글)":
                            exerciseNameKR = value
                        case "횟수":
                            reps = value == "null" ? nil : value
                        case "세트":
                            sets = value == "null" ? nil : value
                        case "무게(kg)":
                            weight = value == "null" ? nil : value
                        case "시간(초)":
                            duration = value == "null" ? nil : value
                        default:
                            break
                    }
                }
            }

            let routine = WeeklyRoutine(
                 // TODO: API에서 넘겨줄거임
                day: day,
                exerciseArea: exerciseArea,
                exerciseNameEN: exerciseNameEN,
                exerciseNameKR: exerciseNameKR,
                reps: reps,
                sets: sets,
                weight: weight,
                duration: duration
            )
            activityWeeklyRoutine.append(routine)
            print(routine)
        }
    }

}
