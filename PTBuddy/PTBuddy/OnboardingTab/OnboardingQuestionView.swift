//
//  OnboardingQuestionView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/6/24.
//

import SwiftUI

struct OnboardingQuestionView: View {
    @EnvironmentObject var memberInfo: OnboardingMemberInfo
    @State private var selectedAnswer: String?

    var question: OnboardingQuestion

    var body: some View {
        NavigationView(content: {
            VStack {
                OnboardingMainTitleView(mainTitleText: question.mainTitle)
                if let subTitle = question.subTitle {
                    OnboardingSubTitleView(subTitleText: subTitle)
                }

                if let answers = question.answers {
                    ForEach(answers, id: \.self) { answer in
                        OnboardingButtonView(buttonText: answer, isSelected: selectedAnswer == answer ? true : false) {
                            switch question.id {
                            case 2:
                                memberInfo.basicInfo.gender = answer
                            default:
                                break
                            }
                        }
                    }
                } else {
                    switch question.id {
                    case 1:
                        OnboardingTextFieldView(placeholder: "이름", text: $memberInfo.basicInfo.nick)
                    case 4:
                        OnboardingTextFieldView(placeholder: "160cm", text: $memberInfo.basicInfo.height)
                    case 5:
                        OnboardingTextFieldView(placeholder: "55kg", text: $memberInfo.basicInfo.weight)
                    case 20:
                        OnboardingTextFieldView(placeholder: "55kg", text: $memberInfo.activityGoal.goalWeight)
                    default:
                        Text("기본")
                    }
                }
                Spacer()
            }
        })
    }
}

//#Preview {
//    OnboardingQuestionView(question: OnboardingQuestion(id: 6, mainTitle: "하루에 식사를\n몇 끼 정도 먹나요?", subTitle: "아침, 아점, 점심 등 메인 식사 기준", answers: ["1끼", "2끼", "3끼", "4끼", "5끼 이상"]))
//}
