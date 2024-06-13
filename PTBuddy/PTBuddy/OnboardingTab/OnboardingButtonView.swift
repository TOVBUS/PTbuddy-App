//
//  OnboardingButtonView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import SwiftUI

struct OnboardingButtonView: View {
    var buttonText: String
    @Binding var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            isSelected.toggle()
            action()
        }) {
            HStack {
                Text(buttonText)
                    .pretendardFont(.Regular, size: 16)
                    .foregroundColor(.black)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 12).stroke(Color.black, lineWidth: 1.0)
            )
        }
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 30)
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    OnboardingButtonView(buttonText: "헬스", isSelected: .constant(.random()), action: {})
}
