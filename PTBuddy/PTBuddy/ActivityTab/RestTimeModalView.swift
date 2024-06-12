//
//  RestTimeModalView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/12/24.
//

import SwiftUI

struct RestTimeModalView: View {
    @StateObject private var activityTimerVM = ActivityTimerViewModel()

    @State private var times = ["0:15", "0:30", "1:00", "1:30", "2:00"]
    @State private var selectedTime: String = "0:30"

    var body: some View {
        VStack {
            Text("휴식 타이머")
                .pretendardFont(.Bold, size: 24)

            HStack {
                ForEach(times, id: \.self) { time in
                    Button(action: {
                        selectedTime = time
                        if let duration = timeInterval(from: time) {
                            activityTimerVM.startExerciseTimer(duration: duration)
                        }
                    }, label: {
                        Text(time)
                            .padding()
                            .background(selectedTime == time ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
            }

            CircularTimerView(remainingTime: activityTimerVM.currentExerciseTime)
                .frame(width: 200, height: 200)
                .padding()

            HStack {
                Button(action: {
                    activityTimerVM.stopExerciseTimer()
                }) {
                    Text("휴식 중단")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    if let duration = timeInterval(from: selectedTime ?? "0:50") {
                        activityTimerVM.startExerciseTimer(duration: duration)
                    }
                }) {
                    Text("휴식 시작")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }

    private func timeInterval(from timeString: String) -> TimeInterval? {
        let components = timeString.split(separator: ":").compactMap { Int($0) }
        guard components.count == 2 else { return nil }
        let minutes = components[0]
        let seconds = components[1]
        return TimeInterval(minutes * 60 + seconds)
    }
}

#Preview {
    RestTimeModalView()
}
