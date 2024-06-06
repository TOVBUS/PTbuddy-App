//
//  OnboardingMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct OnboardingMainView: View {

    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: Text("Destination")) { Text("Navigate") }
        })
    }
}

#Preview {
    OnboardingMainView()
}
