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
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(20)
        }
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 30)
        .buttonStyle(PlainButtonStyle())
    }
}



#Preview {
    MainButtonView(buttonText: "다음") {
        print("navigation연결")
    }
}
