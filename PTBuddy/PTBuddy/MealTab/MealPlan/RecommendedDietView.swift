//
//  RecommendedDietView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct RecommendedDietView: View {
    @EnvironmentObject var viewModel: MealPlanViewModel
    @State private var recommendedDiet: (breakfast: String, lunch: String, dinner: String) = ("", "", "")

    var body: some View {
        VStack(alignment: .leading) {
            Text("식단")
                .pretendardFont(.Bold, size: 25)
                .padding(.bottom, 20)
                .padding(.horizontal, 30)
            
            Text("오늘의 추천식단")
                .pretendardFont(.Bold, size: 20)
                .padding(.horizontal, 30)
            
            VStack(alignment: .leading, spacing: 10) {
                MealDetailView(mealType: "아침", mealDetail: recommendedDiet.breakfast)
                MealDetailView(mealType: "점심", mealDetail: recommendedDiet.lunch)
                MealDetailView(mealType: "저녁", mealDetail: recommendedDiet.dinner)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange.opacity(0.2))
            .cornerRadius(20)
            .padding(.bottom, 20)
            .padding(.horizontal, 30)
        }
        .onAppear {
            fetchRecommendedDiet()
        }
    }
    
    func fetchRecommendedDiet() {
        let currentDay = getCurrentDay()
        print("Current day: \(currentDay)")

        if let mealPlan = viewModel.mealPlans.first(where: { $0.day == currentDay }) {
            recommendedDiet = (
                breakfast: mealPlan.breakfast,
                lunch: mealPlan.lunch,
                dinner: mealPlan.dinner
            )
            print("Recommended diet updated: \(recommendedDiet)")
        } else {
            recommendedDiet = ("추천 식단이 없습니다.", "추천 식단이 없습니다.", "추천 식단이 없습니다.")
            print("No recommended diet found for day: \(currentDay)")
        }
    }
    
    func getCurrentDay() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "EEEE"
        return formatter.string(from: Date())
    }
}

struct MealDetailView: View {
    let mealType: String
    let mealDetail: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(mealType)
                .pretendardFont(.Bold, size: 16)
            Text(mealDetail)
                .pretendardFont(.Regular, size: 16)
                .padding(.bottom, 5)
        }
    }
}

struct RecommendedDietView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedDietView()
            .environmentObject(MealPlanViewModel())
    }
}





