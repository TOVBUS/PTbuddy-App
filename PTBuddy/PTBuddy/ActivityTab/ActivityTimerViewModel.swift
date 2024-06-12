//
//  ActivityTimerViewModel.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/12/24.
//

import Foundation
import Combine

class ActivityTimerViewModel: ObservableObject {
    @Published var totalElapsedTime: TimeInterval = 0
    @Published var currentExerciseTime: TimeInterval = 0
    @Published var isRunning: Bool = false

    private var totalTimer: Timer?
    private var exerciseTimer: Timer?
    private var startTime: Date?

    func startTotalTimer() {
        startTime = Date()
        totalElapsedTime = 0
        isRunning = true
        totalTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self, let startTime = self.startTime else { return }
            self.totalElapsedTime = Date().timeIntervalSince(startTime)
        }
    }

    func stopTotalTimer() {
        totalTimer?.invalidate()
        totalTimer = nil
        isRunning = false
    }

    func startExerciseTimer(duration: TimeInterval) {
        currentExerciseTime = duration
        exerciseTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.currentExerciseTime > 0 {
                self.currentExerciseTime -= 1
            } else {
                self.stopExerciseTimer()
            }
        }
    }

    func stopExerciseTimer() {
        exerciseTimer?.invalidate()
        exerciseTimer = nil
    }
}
