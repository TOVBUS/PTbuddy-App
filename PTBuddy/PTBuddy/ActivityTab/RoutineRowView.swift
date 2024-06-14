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
        Section(header: Text(routine.day)) {
            VStack(alignment: .leading) {
                Text("부위: \(routine.exerciseArea)")
                Text("운동(영어): \(routine.exerciseNameEN)")
                Text("운동(한글): \(routine.exerciseNameKR)")
                if let reps = routine.reps {
                    Text("횟수: \(reps)")
                }
                if let sets = routine.sets {
                    Text("세트: \(sets)")
                }
                if let weight = routine.weight {
                    Text("무게(kg): \(weight)")
                }
                if let duration = routine.duration {
                    Text("시간(초): \(duration)")
                }
            }
            .padding()
        }
    }
}


struct ActivityDetailView: View {
    let activity: Activity
    
    var body: some View {
        Text("ActivityDetailView")
    }
}

//#Preview {
//    RoutineRowView(activity: Activity)
//}
