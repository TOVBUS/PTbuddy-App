//
//  OnboardingQuestionView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/6/24.
//

import SwiftUI

struct OnboardingQuestionView: View {
    @EnvironmentObject var memberInfo: OnboardingMemberInfo
    @State var selectedAnswer: [String] = Array(repeating: "", count: 30)

    var question: OnboardingQuestion

    var body: some View {
        NavigationView {
            VStack {
                OnboardingMainTitleView(mainTitleText: question.mainTitle)
                if let subTitle = question.subTitle {
                    OnboardingSubTitleView(subTitleText: subTitle)
                }

                QuestionContentView(question: question, selectedAnswer: $selectedAnswer)
                    .environmentObject(memberInfo)
                Spacer()
            }
        }
    }
}

struct QuestionContentView: View {
    var question: OnboardingQuestion
    @Binding var selectedAnswer: [String]
    @EnvironmentObject var memberInfo: OnboardingMemberInfo

    var body: some View {
        if let answers = question.answers {
            ForEach(answers, id: \.self) { answer in
                OnboardingButtonView(buttonText: answer, isSelected: .constant(selectedAnswer[question.id] == answer)) {
                    selectedAnswer[question.id] = answer
                    updateMemberInfo(questionId: question.id, answer: answer)
                }
            }
        } else {
            switch question.id {
            case 1:
                OnboardingTextFieldView(placeholder: "이름", text: $memberInfo.basicInfo.nick)
            case 3:
                OnboardingDatePickerView(selectedDateString: $memberInfo.basicInfo.birth)
            case 4:
                OnboardingTextFieldView(placeholder: "160cm", text: $memberInfo.basicInfo.height)
            case 5:
                OnboardingTextFieldView(placeholder: "55kg", text: $memberInfo.basicInfo.weight)
            case 21:
                OnboardingTextFieldView(placeholder: "55kg", text: $memberInfo.activityGoal.goalWeight)
            default:
                Text("기본")
            }
        }
    }

    private func updateMemberInfo(questionId: Int, answer: String) {
        let updateActions: [Int: (String) -> Void] = [
            2: { answer in memberInfo.basicInfo.gender = answer },
            6: { answer in memberInfo.eatingHabit.mealAmout = answer },
            7: { answer in memberInfo.eatingHabit.mealCount = answer },
            8: { answer in memberInfo.eatingHabit.carbohydratePerMealCount = answer },
            9: { answer in memberInfo.eatingHabit.proteinPerMealCount = answer },
            10: { answer in memberInfo.eatingHabit.vegetablePerMealCount = answer },
            11: { answer in memberInfo.eatingHabit.waterIntakePerDay = answer },
            12: { answer in memberInfo.eatingHabit.alcoholIntake = answer },
            13: { answer in memberInfo.activityHabit.usualActivity = answer },
            14: { answer in memberInfo.activityHabit.dailyStep = answer },
            15: { answer in memberInfo.activityHabit.pushUpCount = answer },
            16: { answer in memberInfo.activityHabit.isRegularActivity = answer },
            17: { answer in memberInfo.activityHabit.regularActivity = answer },
            18: { answer in memberInfo.activityHabit.regularActivityCount = answer },
            19: { answer in memberInfo.activityHabit.activityTimePerDay = answer },
            20: { answer in memberInfo.activityHabit.changeActivity = answer },
            22: { answer in memberInfo.activityGoal.activityGoal = answer },
            23: { answer in memberInfo.activityGoal.activityPlace = answer },
            24: { answer in memberInfo.activityGoal.preferenceActivity = answer },
            25: { answer in memberInfo.activityGoal.activityFrequency = answer }
        ]

        if let action = updateActions[questionId] {
            action(answer)
        }
    }
}

//#Preview {
//    OnboardingQuestionView(question: OnboardingQuestion(id: 6, mainTitle: "하루에 식사를\n몇 끼 정도 먹나요?", subTitle: "아침, 아점, 점심 등 메인 식사 기준", answers: ["1끼", "2끼", "3끼", "4끼", "5끼 이상"]))
//}
