//
//  RoutineRowView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import SwiftUI

struct RoutineRowView: View {
    let routine: Routine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(routine.day)
                .pretendardFont(.Bold, size: 20)
            
            Text("부위: \(routine.exerciseArea)")
                .pretendardFont(.Medium, size: 16)
            
            Text("운동: \(routine.exerciseNameKR) (\(routine.exerciseNameEN))")
                .pretendardFont(.Regular, size: 16)
            
            if let reps = routine.reps {
                Text("횟수: \(reps)")
                    .pretendardFont(.Regular, size: 16)
            }
            
            if let sets = routine.sets {
                Text("세트: \(sets)")
                    .pretendardFont(.Regular, size: 16)
            }
            
            if let weight = routine.weight {
                Text("무게: \(weight)kg")
                    .pretendardFont(.Regular, size: 16)
            }
            
            if let duration = routine.duration {
                Text("시간: \(duration)초")
                    .pretendardFont(.Regular, size: 16)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 16)
        
    }
}

struct ActivityDetailView: View {
    let activity: Activity
    
    var body: some View {
        Text("ActivityDetailView")
    }
}

#Preview {
    RoutineRowView(routine: ActivityViewModel().routines[0])
}
