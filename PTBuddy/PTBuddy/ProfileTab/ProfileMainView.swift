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
    let userId: String = "혜수님" // 예시로 회원 ID를 지정했습니다. 실제로는 동적으로 설정되어야 합니다.
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("오늘의 피드백")
                        .pretendardFont(.Bold, size: 20)
                    
                    Text(feedback)
                        .pretendardFont(.Regular, size: 20)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange.opacity(0.5))
                        .cornerRadius(20)
                        .lineSpacing(5) // 줄 간격 조정
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    
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
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
            .padding()
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("프로필")
                        .pretendardFont(.Bold, size: 24)
                }
            }
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
        // 여기에 API 호출 코드 추가
        // 예시:
        // let url = URL(string: "https://api.example.com/feedback")!
        // URLSession.shared.dataTask(with: url) { data, response, error in
        //     if let data = data {
        //         if let feedbackResponse = try? JSONDecoder().decode(Feedback.self, from: data) {
        //             DispatchQueue.main.async {
        //                 self.feedback = feedbackResponse.message
        //             }
        //         }
        //     }
        // }.resume()
        
        // 임시로 예시 데이터 설정
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.feedback = "\(userId)!\n빨리 일어나세요! 어제 많이 드셨잖아요~ 😊"
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
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

