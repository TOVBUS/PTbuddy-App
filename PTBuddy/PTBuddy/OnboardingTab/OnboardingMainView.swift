//
//  OnboardingMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct OnboardingMainView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    @State var currentQuestionIndex = 0

    var body: some View {

        NavigationView(content: {
            ZStack(alignment: .bottom, content: {
                OnboardingQuestionView(question: onboardingQuestions[currentQuestionIndex])

                VStack {
                    Spacer()
                    MainButtonView(buttonText: "다음") {
                        if currentQuestionIndex < onboardingQuestions.count - 1 {
                            currentQuestionIndex += 1
                        }
                    }
                }

            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if currentQuestionIndex >= 1 {
                        Button(action: {
                            currentQuestionIndex -= 1
                        }, label: {
                            Image(systemName: "chevron.left")
                        })
                    }
                }
            }
            .navigationTitle("온보딩")
            .navigationBarTitleDisplayMode(.inline)
        })
    }
}

#Preview {
    OnboardingMainView()
}
