//
//  MealMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI
import SwiftData

struct MealMainView: View {
    @Environment(\.modelContext) private var context: ModelContext

    @StateObject private var viewModel = MealPlanViewModel()

    var body: some View {
        ScrollView {
            VStack() {
                RecommendedDietView()
                    .environmentObject(viewModel)

                MealRecordsView()
                    .environmentObject(viewModel)
            }

            Spacer()
//            MainButtonView(buttonText: "피버에게 식단 추천 받기") {
//                viewModel.fetchMealPlanFromAPI()
//            }
            Button(action: {
                // 버튼 액션
                viewModel.fetchMealPlanFromAPI()
            }) {
                Text("피버에게 식단 추천 받기")
                    .pretendardFont(.SemiBold, size: 18)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            .padding(.vertical)
        }
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
        .padding(.top, 20)
        .onAppear {
            viewModel.setContext(context)
        }
    }
}
