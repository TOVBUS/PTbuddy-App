//
//  OnboardingButtonView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import SwiftUI

struct OnboardingButtonView: View {
    var buttonText: String

    var body: some View {
        Button(action: {

        }) {
            Text(buttonText)
                .font(.title)
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background()
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2.0)
                )
        }
        .contentShape(RoundedRectangle(cornerRadius: 15))
        .padding()
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    OnboardingButtonView(buttonText: "헬스")
}

