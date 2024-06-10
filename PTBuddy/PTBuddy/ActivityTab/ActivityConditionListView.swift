//
//  ActivityConditionListView.swift
//  PTBuddy
//
//  Created by DOYEON JEONG on 6/9/24.
//

import SwiftUI

struct Condition: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    
    static let defaults: [Condition] = [
        Condition(title: "125%", description: "컨디션이 평소보다 훨씬 좋습니다."),
        Condition(title: "100%", description: "평소와 같은 상태입니다."),
        Condition(title: "75%", description: "몸이 무겁게 느껴집니다."),
        Condition(title: "50%", description: "피곤하고 기운이 없습니다."),
        Condition(title: "25%", description: "몸 상태가 매우 좋지 않습니다.")
    ]
}

struct ActivityConditionListView: View {
    let conditions = Condition.defaults
    
    var body: some View {
        VStack {
            HStack {
                Text("신체 컨디션")
                    .pretendardFont(.Bold, size: 26)
                    .padding(.top, 20)
                
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 10)
            
            HStack {
                Text("오늘의 컨디션에 맞춰 운동 강도를 조절해드려요.")
                    .pretendardFont(.Medium, size: 16)
                    .padding(.bottom, 20)
                
                Spacer()
            }
            .padding(.leading, 20)
            
            List(conditions) { condition in
                VStack(alignment: .leading) {
                    Text(condition.title)
                        .pretendardFont(.SemiBold, size: 18)
                        .padding(.bottom, 8)
                    
                    Text(condition.description)
                        .pretendardFont(.Regular, size: 14)
                        .foregroundColor(.gray)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
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
    ActivityConditionListView()
}
