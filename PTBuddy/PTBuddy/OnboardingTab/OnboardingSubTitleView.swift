//
//  OnboardingSubTitleView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import SwiftUI

struct OnboardingSubTitleView: View {
    var subTitleText: String

    var body: some View {
        HStack {
            Text(subTitleText)
                .pretendardFont(.Light, size: 12)
                .frame(alignment: .leading)
            Spacer()
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 20)
        
    }
}

#Preview {
    OnboardingSubTitleView(subTitleText: "선택지에 없다면 비슷한 강도의 운동을 선택해주세요")
}
