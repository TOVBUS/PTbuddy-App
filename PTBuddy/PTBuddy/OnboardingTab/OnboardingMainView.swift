//
//  OnboardingMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct OnboardingMainView: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    @EnvironmentObject var onboardingVM: OnboardingViewModel
    @State var currentQuestionIndex = 0
    @State var showLoadingView = true
    
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
                        Group {
                            if showLoadingView {
                                LoadingView()
                                    .transition(.opacity)
                            } else {
                                VStack {
                                    Spacer()
                                    Image("Logo")
                                    Spacer()
                                    MainButtonView(buttonText: "메인으로 이동하기!") {
                                        navigationStackManager.isOnboardingCompleted = true
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                .background(Color.white)
                                .transition(.opacity)
                            }
                        }
                        .onAppear(perform: {
                            onboardingVM.fetchActivityRoutine { }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
                                withAnimation {
                                    print("showLoadingView : \(showLoadingView)")
                                    showLoadingView = false
                                    print("showLoadingView : \(showLoadingView)")
                                }
                            }
                        })
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if currentQuestionIndex >= 1 && currentQuestionIndex < 25{
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
