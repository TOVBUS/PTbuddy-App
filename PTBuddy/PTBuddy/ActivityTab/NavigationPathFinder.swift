//
//  NavigationPathFinder.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import Foundation
import SwiftUI

enum ViewOptions: Hashable {
    case activityDetail(activity: Activity)
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .activityDetail(let activity):
            ActivityDetailView(activity: activity)
        }
    }
}

final class NavigationPathFinder: ObservableObject {
    static let shared = NavigationPathFinder()
    private init() { }
    
    @Published var path: NavigationPath = .init()
    
    func addPath(option: ViewOptions) {
        path.append(option)
    }
    
    func popToRoot() {
        path = .init()
    }
}
