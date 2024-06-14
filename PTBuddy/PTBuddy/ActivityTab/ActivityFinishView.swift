//
//  ActivityFinishView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import SwiftUI

struct ActivityFinishView: View {
    @EnvironmentObject var navPathFinder: NavigationPathFinder

    var body: some View {
        ZStack {
            GifImage("confetti")
                .background(Color(.red))
                .frame(maxWidth: .infinity)
                .padding()
            
            VStack {
                Text("오늘의 루틴을 완료했군요?")
                    .pretendardFont(.Bold, size: 24)
                Text("축하합니다!")
                    .pretendardFont(.SemiBold, size: 24)
                    .padding(.bottom, 20)
                
                Button(action: {
                    navPathFinder.popToRoot()
                }) {
                    Text("메인화면으로 이동하기")
                        .pretendardFont(.SemiBold, size: 18)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ActivityFinishView()
}
