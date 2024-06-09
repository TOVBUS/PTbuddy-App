//
//  ActivityRoutineRow.swift
//  PTBuddy
//
//  Created by DOYEON JEONG on 6/9/24.
//

import SwiftUI

struct ActivityRoutineRow: View {
    var title: String
    var activities: [String]
    
    var body: some View {
        HStack {
            Text(title)
                .frame(minWidth: 40)
                .pretendardFont(.SemiBold, size: 14)
                .padding(.leading, 16)
            
            ForEach(activities, id: \.self) { activity in
                makeSet(activity: activity)
            }
        }
        .padding(.trailing, 8)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
        )
    }
    
    @ViewBuilder
    func makeSet(activity: String) -> some View {
        VStack {
            // TODO: need to change for thumbnail
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 40, height: 40)
                .foregroundStyle(Color.gray)
            
            Text(activity)
                .pretendardFont(.Light, size: 14)
                .frame(minWidth: 40)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 8)
    }
}

#Preview {
    ActivityRoutineRow(title: "제목", activities: ["운동1", "운동2", "운동3", "운동4"])
}
