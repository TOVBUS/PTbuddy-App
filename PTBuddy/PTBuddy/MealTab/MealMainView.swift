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
            VStack(alignment: .leading) {
                RecommendedDietView()
                    .environmentObject(viewModel)

                 MealRecordsView()
                     .environmentObject(viewModel)

                Spacer()

                GetDietButton(action: viewModel.fetchMealPlanFromAPI)
            }
            .padding(.horizontal)
        }
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
        .padding(.top, 30)
        .onAppear {
            viewModel.setContext(context)
        }
    }
}
