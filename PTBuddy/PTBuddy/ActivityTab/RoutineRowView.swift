//
//  RoutineRowView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import SwiftUI

struct RoutineRowView: View {
    let routine: WeeklyRoutine
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(routine.day)
                    .pretendardFont(.Bold, size: 20)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("부위: \(routine.exerciseArea)")
                    .pretendardFont(.Medium, size: 16)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            HStack {
                Text("운동: \(routine.exerciseNameKR) (\(routine.exerciseNameEN))")
                    .pretendardFont(.Regular, size: 16)
                Spacer()
            }
            .padding(.horizontal, 16)
            
            if let reps = routine.reps {
                HStack {
                    Text("횟수: \(reps)")
                        .pretendardFont(.Regular, size: 16)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            
            if let sets = routine.sets {
                HStack {
                    Text("세트: \(sets)")
                        .pretendardFont(.Regular, size: 16)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            
            if let weight = routine.weight {
                HStack {
                    Text("무게: \(weight)kg")
                        .pretendardFont(.Regular, size: 16)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
            
            if let duration = routine.duration {
                HStack {
                    Text("시간: \(duration)초")
                        .pretendardFont(.Regular, size: 16)
                    Spacer()
                }
                .padding(.horizontal, 16)
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

#Preview {
    RoutineRowView(routine: WeeklyRoutine(day: "월요일", exerciseArea: "전신 유산소", exerciseNameEN: "Treadmill Running", exerciseNameKR: "트레드밀 달리기", reps: nil, sets: nil, weight: nil, duration: "3600"))
}
