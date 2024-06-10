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
                    .font(.title)
                    .foregroundColor(.black)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 15).stroke(Color.black, lineWidth: 2.0)
            )
        }
        .contentShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 30)
        .buttonStyle(PlainButtonStyle())
    }
}

//#Preview {
//    OnboardingButtonView(buttonText: "헬스")
//}

