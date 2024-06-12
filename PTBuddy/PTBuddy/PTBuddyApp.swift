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
    var body: some Scene {
        WindowGroup {
<<<<<<< HEAD
<<<<<<< HEAD
            //MealMainView()
                //.modelContainer(for: MealRecord.self)
            ContentView()
=======
<<<<<<< HEAD
            ContentView()
//                .environmentObject(onboardingVM)
=======
            MealMainView()
                .modelContainer(for: MealRecord.self)
>>>>>>> 11f976a (✨ :: MealTab에 SwiftData 적용 #15)
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
=======
            MealMainView()
                .modelContainer(for: [MealRecord.self, MealPlan.self])
>>>>>>> ef0b94c (✨ :: 식단탭 오늘의 식단 추천받기 기능 구현 #18)
        }
    }
}



