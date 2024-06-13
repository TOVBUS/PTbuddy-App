//
//  LoadingView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/13/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            GifImage("loading").background(Color(.red))
                .frame(width: 120, height: 120, alignment: .center)
                .padding()
            Text("추천 운동 루틴을 연구중입니다\n조금만 기다려주세요")
                .pretendardFont(.Medium, size: 15)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
        }.background(Color.white)
    }
}

#Preview {
    LoadingView()
}
