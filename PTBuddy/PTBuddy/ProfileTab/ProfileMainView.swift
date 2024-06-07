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
        NavigationView{
            VStack(alignment: .leading){
                
                VStack(alignment: .leading){
                    Text("오늘의 피드백")
                        .font(.title3)
                    
                    Text(feedback)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange.opacity(0.5))
                        .cornerRadius(20)
                }
                .padding(.bottom, 20)
                
                VStack(alignment: .leading){
                    
                    Text("설정")
                        .font(.title3)
                    
                    Button(action:{
                        showPrivacyPolicy = true
                    }){
                        Text("개인정보처리방침")
                            .foregroundStyle(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        if let url = URL(string: "https://apps.apple.com/app/idXXXXXXXX"){
                            UIApplication.shared.open(url)
                        }
                    }){
                        Text("리뷰 남기기")
                            .foregroundStyle(.black)
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
            .navigationTitle("프로필")
            .sheet(isPresented: $showPrivacyPolicy){
                WebView(url: URL(string: "https://www.notion.so/your-notion-page-url")!)
            }
            .onAppear{
                fetchFeedback()
            }
        }
    }
    
    func fetchFeedback(){
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
                    self.feedback = "혜수님! 빨리 일어나세요! 어제 많이 드셨잖아요~ 😊"
                }
    }
    
}

#Preview {
    ProfileMainView()
}
