//
//  NavigationStackManager.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/13/24.
//

import SwiftUI

class NavigationStackManager: ObservableObject {
    @Published var isOnboardingCompleted: Bool {
        didSet {
            UserDefaults.standard.set(isOnboardingCompleted, forKey: "isOnboardingCompleted")
        }
    }
    
    init() {
        self.isOnboardingCompleted = UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    }
}
