//
//  GetDietButton.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/3/24.
//

import SwiftUI

struct GetDietButton: View {
    var body: some View {
        Button(action: {
            // 식단 추천 받기 로직 추가
        }) {
            Text("식단 추천 받기")
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding(.top, 20)
    }
}

struct GetDietButton_Previews: PreviewProvider {
    static var previews: some View {
        GetDietButton()
    }
}
