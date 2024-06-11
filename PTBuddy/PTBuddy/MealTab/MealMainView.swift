//
//  MealMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct MealMainView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RecommendedDietView()
                
                MealRecordsView()
                
                Spacer()
                
                GetDietButton()
            }
            .padding(.horizontal) // 가로 패딩 추가
        }
    }
}

#Preview {
    MealMainView()
        .modelContainer(for: MealRecord.self, inMemory: true) // Preview용 inMemory 설정
}

