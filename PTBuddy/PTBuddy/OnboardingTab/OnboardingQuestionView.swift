//
//  OnboardingQuestionView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/6/24.
//

import SwiftUI

struct OnboardingQuestionView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    @State var selectedAnswer: [String] = Array(repeating: "", count: 30)

    var question: OnboardingQuestion

    var body: some View {
        VStack {
            OnboardingMainTitleView(mainTitleText: question.mainTitle)
            if let subTitle = question.subTitle {
                OnboardingSubTitleView(subTitleText: subTitle)
            }

            QuestionContentView(question: question, selectedAnswer: $selectedAnswer)
                .environmentObject(viewModel.memberInfo)
            Spacer()
        }
    }
}

struct QuestionContentView: View {
    var question: OnboardingQuestion
    @Binding var selectedAnswer: [String]
    @EnvironmentObject var viewModel: OnboardingViewModel
    let defaultDate = Date()

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
                    OnboardingTextFieldView(placeholder: "이름", text: $viewModel.memberInfo.basicInfo.nick, keyboardType: .default)
            case 3:
                    let birthDate = viewModel.memberInfo.basicInfo.birth.toDate(withFormat: "yyyy-MM-dd") ?? defaultDate
                OnboardingDatePickerView(selectedDate: Binding<Date>(
                    get: {
                        birthDate
                    }, set: { newValue in
                        viewModel.memberInfo.basicInfo.birth = newValue.toString(withFormat: "yyyy-MM-dd")
                    }
                ))
            case 4:
                    OnboardingTextFieldView(placeholder: "160cm", text: $viewModel.memberInfo.basicInfo.height, keyboardType: .numberPad)
            case 5:
                    OnboardingTextFieldView(placeholder: "55kg", text: $viewModel.memberInfo.basicInfo.weight, keyboardType: .numberPad)
            case 21:
                    OnboardingTextFieldView(placeholder: "55kg", text: $viewModel.memberInfo.activityGoal.goalWeight, keyboardType: .numberPad)
            default:
                Text("기본")
            }
        }
    }

    private func updateMemberInfo(questionId: Int, answer: String) {
        let updateActions: [Int: (String) -> Void] = [
            2: { answer in viewModel.memberInfo.basicInfo.gender = answer },
            6: { answer in viewModel.memberInfo.eatingHabit.mealAmout = answer },
            7: { answer in viewModel.memberInfo.eatingHabit.mealCount = answer },
            8: { answer in viewModel.memberInfo.eatingHabit.carbohydratePerMealCount = answer },
            9: { answer in viewModel.memberInfo.eatingHabit.proteinPerMealCount = answer },
            10: { answer in viewModel.memberInfo.eatingHabit.vegetablePerMealCount = answer },
            11: { answer in viewModel.memberInfo.eatingHabit.waterIntakePerDay = answer },
            12: { answer in viewModel.memberInfo.eatingHabit.alcoholIntake = answer },
            13: { answer in viewModel.memberInfo.activityHabit.usualActivity = answer },
            14: { answer in viewModel.memberInfo.activityHabit.dailyStep = answer },
            15: { answer in viewModel.memberInfo.activityHabit.pushUpCount = answer },
            16: { answer in viewModel.memberInfo.activityHabit.isRegularActivity = answer },
            17: { answer in viewModel.memberInfo.activityHabit.regularActivity = answer },
            18: { answer in viewModel.memberInfo.activityHabit.regularActivityCount = answer },
            19: { answer in viewModel.memberInfo.activityHabit.activityTimePerDay = answer },
            20: { answer in viewModel.memberInfo.activityHabit.changeActivity = answer },
            22: { answer in viewModel.memberInfo.activityGoal.activityGoal = answer },
            23: { answer in viewModel.memberInfo.activityGoal.activityPlace = answer },
            24: { answer in viewModel.memberInfo.activityGoal.preferenceActivity = answer },
            25: { answer in viewModel.memberInfo.activityGoal.activityFrequency = answer }
        ]

        if let action = updateActions[questionId] {
            action(answer)
        }
    }
}

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}

extension Date {
    func toString(withFormat format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

#Preview {
    let viewModel = OnboardingViewModel()

    return OnboardingQuestionView(question: OnboardingQuestion(id: 6, mainTitle: "하루에 식사를\n몇 끼 정도 먹나요?", subTitle: "아침, 아점, 점심 등 메인 식사 기준", answers: ["1끼", "2끼", "3끼", "4끼", "5끼 이상"]))
        .environmentObject(viewModel)
}
