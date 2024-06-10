//
//  RecommendedDietView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct RecommendedDietView: View {

    @State private var recommendedDiet: String = "AI에서 추천받는 응답을 기다리고 있습니다."
    
    var body: some View {
        VStack(alignment: .leading){
            Text("식단")
                .pretendardFont(.Bold, size: 30)
                .padding(.bottom, 20)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            
            Text("오늘의 추천식단")
                .pretendardFont(.Bold, size: 20)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            Text(recommendedDiet)
                .pretendardFont(.Bold, size: 18)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(Color.orange.opacity(0.5))
                .cornerRadius(20)
                .padding(.bottom, 20)
                .padding(.leading, 30)
                .padding(.trailing, 30)
        }
        .onAppear{
            fetchRecommendedDiet()
        }
    }
    
    func fetchRecommendedDiet(){
        //AI추천식단 받아오는 네트워크 요청코드
        recommendedDiet = "AI가 추천해준 식단목록"
    }
    
}

struct RecommendedDietView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedDietView()
    }
}
