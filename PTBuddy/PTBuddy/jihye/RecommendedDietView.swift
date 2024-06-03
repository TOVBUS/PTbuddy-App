//
//  RecommendedDietView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/3/24.
//

import SwiftUI

struct RecommendedDietView: View {
    @State private var recommendedDiet: String = "AI에서 추천받는 응답을 기다리고 있습니다"

    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 추천식단")
                .font(.title)
                .padding(.bottom, 5)

            Text(recommendedDiet)
                .font(.body)
                .padding()
                .background(Color.orange.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
        }
        .onAppear {
            fetchRecommendedDiet()
        }
    }

    func fetchRecommendedDiet() {
        // AI로부터 추천 식단을 받아오는 네트워크 요청 코드를 여기에 추가합니다.
        // 예시로 고정된 텍스트를 사용합니다.
        recommendedDiet = "AI 추천 식단 예시: 닭가슴살 샐러드, 현미밥, 과일, 요거트"
    }
}

struct RecommendedDietView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedDietView()
    }
}
