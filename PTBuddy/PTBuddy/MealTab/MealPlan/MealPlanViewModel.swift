//
//  MealPlanViewModel.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/11/24.
//

import SwiftData
import SwiftUI
import Alamofire

class MealPlanViewModel: ObservableObject {
    private var context: ModelContext?

    @Published var mealPlans: [MealPlan] = []

    init() {}

    func setContext(_ context: ModelContext) {
        self.context = context
        loadMealPlans()
    }

    func loadMealPlans() {
        guard let context = context else { return }
        let fetchDescriptor = FetchDescriptor<MealPlan>()
        do {
            mealPlans = try context.fetch(fetchDescriptor)
            print("Loaded meal plans: \(mealPlans.map { $0.day })")
            
            // 요일을 정렬하는 로직 추가
            let dayOrder = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
            mealPlans.sort {
                guard let firstIndex = dayOrder.firstIndex(of: $0.day),
                      let secondIndex = dayOrder.firstIndex(of: $1.day) else { return false }
                return firstIndex < secondIndex
            }
            print("Sorted meal plans: \(mealPlans.map { $0.day })")
        } catch {
            print("Failed to fetch meal plans: \(error.localizedDescription)")
        }
    }


    func fetchMealPlanFromAPI() {
        guard let url = URL(string: "https://ptbuddy-tovbus.azurewebsites.net/ai/meal-routine") else { return }

        let onboardingMemberInfo = OnboardingMemberInfo(
            basicInfo: BasicInfo(nick: "토브", gender: "여성", birth: "19981118", height: "160", weight: "50"),
            eatingHabit: EatingHabit(mealCount: "0.5인분", mealAmout: "하루 한 번 정도", carbohydratePerMealCount: "하루 한 번 정도", proteinPerMealCount: "하루 한 번 정도", vegetablePerMealCount: "하루 한 번 정도", waterIntakePerDay: "500ml 미만", alcoholIntake: "거의 먹지 않음"),
            activityHabit: ActivityHabit(usualActivity: "매우 적은 수준", dailyStep: "5,000보", pushUpCount: "21개 이상", isRegularActivity: "3-6개월", regularActivity: "헬스", regularActivityCount: "3일", activityTimePerDay: "1시간", changeActivity: "늘릴 예정"),
            activityGoal: ActivityGoal(goalWeight: "43kg", activityGoal: "근육 증가", activityPlace: "헬스장", preferenceActivity: "기구 운동", activityFrequency: "3일")
        )

        do {
            let jsonData = try JSONEncoder().encode(onboardingMemberInfo)
            let jsonParameters = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]

            AF.request(url, method: .post, parameters: jsonParameters, encoding: JSONEncoding.default)
                .validate()
                .responseDecodable(of: MealPlanResponse.self) { response in
                    switch response.result {
                    case .success(let result):
                        print("API call success: \(result)")
                        DispatchQueue.main.async {
                            self.saveMealPlans(result.responses)
                        }
                    case .failure(let error):
                        print("Failed to fetch meal plan from API: \(error.localizedDescription)")
                    }
                }
        } catch {
            print("Failed to encode parameters: \(error.localizedDescription)")
        }
    }

    func saveMealPlans(_ responses: [String]) {
        guard let context = context else { return }

        // Clear existing meal plans before saving new ones
        for mealPlan in mealPlans {
            context.delete(mealPlan)
        }

        // 요일을 찾기 위한 배열
        let daysOfWeek = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"]

        // Parsing responses and saving them to context
        for response in responses {
            var currentDay = ""
            var breakfast = "", lunch = "", dinner = ""

            let lines = response.components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            var currentMeal = ""

            for line in lines {
                if daysOfWeek.contains(where: { line.contains($0) }) {
                    if !currentDay.isEmpty && !breakfast.isEmpty && !lunch.isEmpty && !dinner.isEmpty {
                        let mealPlan = MealPlan(day: currentDay, breakfast: breakfast.trimmingCharacters(in: .whitespacesAndNewlines), lunch: lunch.trimmingCharacters(in: .whitespacesAndNewlines), dinner: dinner.trimmingCharacters(in: .whitespacesAndNewlines))
                        context.insert(mealPlan)
                        print("Inserted meal plan: \(mealPlan)") // 디버깅용 출력
                    }
                    currentDay = daysOfWeek.first(where: { line.contains($0) }) ?? ""
                    breakfast = ""
                    lunch = ""
                    dinner = ""
                } else if line.starts(with: "- 아침:") {
                    currentMeal = "breakfast"
                    breakfast += line.replacingOccurrences(of: "- 아침: ", with: "") + "\n"
                } else if line.starts(with: "- 점심:") {
                    currentMeal = "lunch"
                    lunch += line.replacingOccurrences(of: "- 점심: ", with: "") + "\n"
                } else if line.starts(with: "- 저녁:") {
                    currentMeal = "dinner"
                    dinner += line.replacingOccurrences(of: "- 저녁: ", with: "") + "\n"
                } else {
                    switch currentMeal {
                    case "breakfast":
                        breakfast += line + "\n"
                    case "lunch":
                        lunch += line + "\n"
                    case "dinner":
                        dinner += line + "\n"
                    default:
                        continue
                    }
                }
            }

            if !currentDay.isEmpty && !breakfast.isEmpty && !lunch.isEmpty && !dinner.isEmpty {
                let mealPlan = MealPlan(day: currentDay, breakfast: breakfast.trimmingCharacters(in: .whitespacesAndNewlines), lunch: lunch.trimmingCharacters(in: .whitespacesAndNewlines), dinner: dinner.trimmingCharacters(in: .whitespacesAndNewlines))
                context.insert(mealPlan)
                print("Inserted meal plan: \(mealPlan)") // 디버깅용 출력
            }
        }

        do {
            try context.save()
            loadMealPlans()
            print("Meal plans saved and reloaded")
        } catch {
            print("Failed to save meal plans: \(error.localizedDescription)")
        }
    }
}




































