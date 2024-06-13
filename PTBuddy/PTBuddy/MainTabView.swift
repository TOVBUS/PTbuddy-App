//
//  MainTabView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/13/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MealMainView()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("식단")
                }
                .tag(1)
            
            ActivityMainView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("운동")
                }
                .tag(0)
            
            ProfileMainView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("프로필")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView()
}
