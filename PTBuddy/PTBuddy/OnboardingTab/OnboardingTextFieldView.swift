//
//  OnboardingTextFieldView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/6/24.
//

import SwiftUI

struct OnboardingTextFieldView: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .padding(.horizontal, 20)
    }
}

