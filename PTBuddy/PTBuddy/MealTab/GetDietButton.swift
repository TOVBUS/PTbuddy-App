//
//  GetDietButton.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct GetDietButton: View {
    var body: some View {
        Button(action:{
            //식단 추천 받는 로직 추가
        }) {
            Text("식단 추천 받기")
                .pretendardFont(.Bold, size: 20)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
        .padding(.top, 20)
        .padding(.leading, 30)
        .padding(.trailing, 30)

    }
}

#Preview {
    GetDietButton()
}
