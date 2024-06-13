//
//  OnboardingMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct OnboardingMainView: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    @State var currentQuestionIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                OnboardingQuestionView(question: onboardingQuestions[currentQuestionIndex])
                
                VStack {
                    Spacer()
                    if currentQuestionIndex < onboardingQuestions.count - 1 {
                        MainButtonView(buttonText: "다음") {
                            if currentQuestionIndex < onboardingQuestions.count - 1 {
                                currentQuestionIndex += 1
                            }
                        }
                    } else {
                        MainButtonView(buttonText: "메인으로 이동하기!") {
                            navigationStackManager.isOnboardingCompleted = true
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if currentQuestionIndex >= 1 {
                        Button(action: {
                            currentQuestionIndex -= 1
                        }) {
                            Image(systemName: "chevron.left")
                        }
                    } else {
                        Text("")
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OnboardingMainView()
        .environmentObject(NavigationStackManager())
}
