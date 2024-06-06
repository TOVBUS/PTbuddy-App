//
//  OnboardingMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct OnboardingMainView: View {
    @State var currentQuestionIndex = 0
    var memberInfo = OnboardingMemberInfo(basicInfo: BasicInfo(nick: "", gender: "", birth: "", height: "", weight: ""), eatingHabit: EatingHabit(mealCount: "", mealAmout: "", carbohydratePerMealCount: "", proteinPerMealCount: "", vegetablePerMealCount: "", waterIntakePerDay: "", alcoholIntake: ""), activityHabit: ActivityHabit(usualActivity: "", dailyStep: "", pushUpCount: "", isRegularActivity: ""), activityGoal: ActivityGoal(goalWeight: "", activityGoal: "", activityPlace: "", preferenceActivity: "", activityFrequency: ""))

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
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    if currentQuestionIndex >= 1 {
                        Button(action: {
                            currentQuestionIndex -= 1
                        }, label: {
                            Image(systemName: "chevron.left")
                        })
                    }
                }
            })
            .navigationTitle("온보딩")
            .navigationBarTitleDisplayMode(.inline)
        }).environmentObject(memberInfo)
    }
}

#Preview {
    OnboardingMainView()
}
