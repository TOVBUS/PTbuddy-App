//
//  OnboardingMainTitleView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import SwiftUI

struct OnboardingMainTitleView: View {
    var mainTitleText: String

    var body: some View {
        HStack {
            Text(mainTitleText)
                .font(.title)
                .fontWeight(.bold)
                .frame(alignment: .leading)
            Spacer()
        }.padding(.horizontal, 20)
    }
}

#Preview {
    OnboardingMainTitleView(mainTitleText: "지금 규칙적으로\n운동하고 있나요?")
}
