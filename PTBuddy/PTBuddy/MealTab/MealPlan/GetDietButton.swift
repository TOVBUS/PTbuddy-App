//
//  GetDietButton.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct GetDietButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("식단 추천 받기")
                .font(.system(size: 20, weight: .bold))
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

struct GetDietButton_Previews: PreviewProvider {
    static var previews: some View {
        GetDietButton(action: {})
    }
}



