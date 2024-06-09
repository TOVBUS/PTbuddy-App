//
//  ActivityTimeListView.swift
//  PTBuddy
//
//  Created by DOYEON JEONG on 6/9/24.
//

import SwiftUI

struct ActivityTimes: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    
    static let defaultTimes: [ActivityTimes] = [
        ActivityTimes(title: "짧게", description: "약 18분"),
        ActivityTimes(title: "조금 짧게", description: "약 26분"),
        ActivityTimes(title: "보통", description: "약 35분"),
        ActivityTimes(title: "조금 길게", description: "약 44분"),
        ActivityTimes(title: "길게", description: "약 53분"),
        ActivityTimes(title: "아주 길게", description: "약 70분")
    ]
}

struct ActivityTimeListView: View {
    let activityTimes: [ActivityTimes]
        
    init(activityTimes: [ActivityTimes] = ActivityTimes.defaultTimes) {
        self.activityTimes = activityTimes
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("운동 시간")
                    .pretendardFont(.Bold, size: 26)
                    .padding(.top, 20)
                
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
            
            HStack {
                Text("선택한 시간에 맞게 운동량을 조절해드려요.")
                    .pretendardFont(.Medium, size: 16)
                    .padding(.bottom, 20)
                
                Spacer()
            }
            .padding(.leading, 20)
            
            List(activityTimes) { time in
                HStack {
                    Text(time.title)
                        .pretendardFont(.SemiBold, size: 18)
                        .padding(.horizontal, 24)
                    Text(time.description)
                        .pretendardFont(.Regular, size: 14)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
                .listRowSeparator(.hidden)
            }
            
            .listStyle(PlainListStyle())
            
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    ActivityTimeListView(activityTimes: ActivityTimes.defaultTimes)
}
