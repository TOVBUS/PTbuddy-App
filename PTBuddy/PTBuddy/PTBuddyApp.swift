//
//  PTBuddyApp.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/3/24.
//

import SwiftUI
import SwiftData

@main
struct PTBuddyApp: App {
    @StateObject var navigationStackManager = NavigationStackManager()
    @StateObject private var onboardingVM = OnboardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            if navigationStackManager.isOnboardingCompleted {
                MainTabView()
                    .environmentObject(navigationStackManager)
                    .modelContainer(for: [MealRecord.self, MealPlan.self])
            } else {
                OnboardingMainView()
                    .environmentObject(navigationStackManager)
                    .environmentObject(onboardingVM)
                    .onAppear {
                        // 앱 시작 시 UserDefaults를 확인하여 초기 상태 설정
                        navigationStackManager.isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
                    }
            }
        }
    }
}
