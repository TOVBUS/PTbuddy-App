//
//  ContentView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var onboardingVM: OnboardingViewModel

    var body: some View {
        VStack {
            Button("api호출") {
                onboardingVM.fetchActivityRoutine { }
                print("onboardingVM.activityWeeklyRoutine: \(onboardingVM.activityWeeklyRoutine)")
                
                print("onboardingVM.rawResponse: \(onboardingVM.rawResponse)")
                
                print("onboardingVM.memberInfo: \(onboardingVM.memberInfo)")
            }

            if let errorMessage = onboardingVM.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }

            Text("Raw Response:")
                .font(.headline)
            ScrollView {
                Text(onboardingVM.rawResponse)
                    .padding()
                    .border(Color.gray)
            }
            .frame(height: 200)

            Text("Activity Routine:")
                .font(.headline)
            ScrollView {
                ForEach($onboardingVM.activityWeeklyRoutine, id: \.id) { routine in
                    VStack {
                        Text("routine.id : \(routine.id)")
                        Text("day : \(routine.day)")
                        Text("exerciseArea : \(routine.exerciseArea)")
                        Text("exerciseNameEN : \(routine.exerciseNameEN)")
                        Text("exerciseNameKR : \(routine.exerciseNameKR)")
                        Text("reps : \(routine.reps)")
                        Text("sets : \(routine.sets)")
                        Text("weight : \(routine.weight)")
                        Text("duration : \(routine.duration)")
                    }
//                    VStack(alignment: .leading) {
//                        Text("routine.day: \(routine.day)")
//                        Text("routine.activityType: \(routine.activityType)")
//                        ForEach(routine.activityRoutine, id: \.engTitle) { activity in
//                            VStack(alignment: .leading) {
//                                Text("activity.engTitle: \(activity.engTitle) / \(activity.korTitle)")
//                                if let count = activity.count {
//                                    Text("activity.count: \(count)")
//                                }
//                                if let set = activity.set {
//                                    Text("activity.set: \(set)")
//                                }
//                                if let weight = activity.weight {
//                                    Text("activity.weight: \(weight) kg")
//                                }
//                                if let time = activity.time {
//                                    Text("activity.time: \(time) seconds")
//                                }
//                            }
//                            .padding(.leading, 10)
//                        }
//                    }
//                    .padding()
//                    .border(Color.blue)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView().environmentObject(OnboardingViewModel())
}
