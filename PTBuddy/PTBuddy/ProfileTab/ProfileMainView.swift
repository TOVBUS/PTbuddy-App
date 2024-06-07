//
//  ProfileMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct ProfileMainView: View {
    
    @State private var feedback: String = "Loading..."
    @State private var showPrivacyPolicy = false
    @State private var showReviewPage = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                    Text("오늘의 피드백")
                        .pretendardFont(.Bold, size: 20)
                    
                    Text(feedback)
                        .pretendardFont(.Regular, size: 20)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange.opacity(0.5))
                        .cornerRadius(20)
                        .lineSpacing(5)
                        .padding(.bottom, 20)
                
                
                    Text("설정")
                        .pretendardFont(.Bold, size: 20)
                    
                    Button(action: {
                        showPrivacyPolicy = true
                    }) {
                        Text("개인정보처리방침")
                            .pretendardFont(.Regular, size: 18)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        showReviewPage = true
                    }) {
                        Text("리뷰 남기기")
                            .pretendardFont(.Regular, size: 18)
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                
                Spacer()
            }
            .padding()
            .navigationTitle("프로필")
            .sheet(isPresented: $showPrivacyPolicy) {
                WebView(url: URL(string: "https://www.notion.so/your-notion-page-url")!)
            }
            .sheet(isPresented: $showReviewPage) {
                ReviewModalView(showReviewPage: $showReviewPage)
            }
            .onAppear {
                fetchFeedback()
            }
        }
    }
    
    func fetchFeedback() {
        // 여기에 서버에서 받아올 feedback 추가
        
        // 임시로 예시 데이터 설정
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.feedback = "혜수님~! 빨리 일어나세요! 어제 많이 드셨잖아요~ 😊"
        }
    }
}

struct ReviewModalView: View {
    @Binding var showReviewPage: Bool
    
    var body: some View {
        VStack {
            Text("잠시 후 앱스토어로 이동합니다...")
                .padding()
                .onAppear {
                    if let url = URL(string: "https://apps.apple.com") {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            UIApplication.shared.open(url)
                            showReviewPage = false
                        }
                    }
                }
            Button(action: {
                showReviewPage = false
            }) {
                Text("닫기")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ProfileMainView()
}

