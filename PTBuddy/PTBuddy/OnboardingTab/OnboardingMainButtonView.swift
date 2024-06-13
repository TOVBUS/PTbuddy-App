//
//  OnboardingMainButtonView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import SwiftUI

struct MainButtonView: View {
    var buttonText: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .pretendardFont(.SemiBold, size: 18)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.orange)
                .cornerRadius(10)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 20)
    }
}

#Preview {
    MainButtonView(buttonText: "다음") {
        print("navigation연결")
    }
}
