//
//  OnboardingCompleteView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/13/24.
//

import SwiftUI

struct OnboardingCompleteView: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager

    var body: some View {
        VStack {
            Spacer()
            Image("AppIcon")
            Spacer()
            MainButtonView(buttonText: "메인으로 이동하기!") {
                navigationStackManager.isOnboardingCompleted = true
            }
        }
    }
}

#Preview {
    OnboardingCompleteView()
}
