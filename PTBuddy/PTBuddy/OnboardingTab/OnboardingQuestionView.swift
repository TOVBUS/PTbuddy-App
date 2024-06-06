//
//  OnboardingQuestionView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/6/24.
//

import SwiftUI

struct OnboardingQuestionView: View {
    var question: OnboardingQuestion

    var body: some View {
        ZStack(alignment: .bottom, content: {
            VStack {
                OnboardingMainTitleView(mainTitleText: question.mainTitle)
                if let subTitle = question.subTitle {
                    OnboardingSubTitleView(subTitleText: subTitle)
                }
                if let answers = question.answers {
                    ForEach(answers, id: \.self) { answer in
                        OnboardingButtonView(buttonText: answer)
                    }
                }
                Spacer()
            }

            VStack {
                Spacer()
                MainButtonView(buttonText: "다음") {

                }
            }
        })
    }
}

#Preview {
    OnboardingQuestionView(question: OnboardingQuestion(id: 6, mainTitle: "하루에 식사를\n몇 끼 정도 먹나요?", subTitle: "아침, 아점, 점심 등 메인 식사 기준", answers: ["1끼", "2끼", "3끼", "4끼", "5끼 이상"]))
}
