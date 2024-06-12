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
            MealMainView()
                .modelContainer(for: [MealRecord.self, MealPlan.self])
        }
    }
}




