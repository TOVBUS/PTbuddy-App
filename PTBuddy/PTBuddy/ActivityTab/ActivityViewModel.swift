//
//  ActivityViewModel.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/7/24.
//

import SwiftUI
import Combine
//import Alamofire

struct Activity: Identifiable {
    var id = UUID()
    var title: String
    var thumbnailURL: String
}

class ActivityViewModel: ObservableObject {
    @Published var activities: [Activity] = [
        Activity(title: "Cable Side Bend", thumbnailURL: "https://github.com/TOVBUS/PTbuddy-App/assets/108422901/17874327-28a3-494d-8ba9-c40130dedc38"),
        Activity(title: "Cable Oblique Crunch", thumbnailURL: "https://github.com/TOVBUS/PTbuddy-App/assets/108422901/8ae6c82a-b9a3-469f-b444-570a9219413a"),
        Activity(title: "Cable Twist", thumbnailURL: "https://github.com/TOVBUS/PTbuddy-App/assets/108422901/8f134143-0497-4dd2-a8aa-a50733bb1c95" ),
        Activity(title: "Weighted Twisting Crunch", thumbnailURL: "https://github.com/TOVBUS/PTbuddy-App/assets/108422901/a1121ea1-6f17-4ad8-abbb-8dff6272f0a7"),
        Activity(title: "Side Plank", thumbnailURL: "https://github.com/TOVBUS/PTbuddy-App/assets/108422901/da26f024-d067-4214-8efd-78e417825234"),
        Activity(title: "Elbow To Knee Sit Up", thumbnailURL: "https://github.com/TOVBUS/PTbuddy-App/assets/108422901/402b4c3a-1616-4350-8412-96ef96ec1603"),
    ]
    @Published var weeklyGoal: Int = 7
    @Published var completedWorkouts: Int = 3
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchActivities()
    }
    
    func fetchActivities() {
//        Alamofire request to fetch activities
//        let url = "https://example.com/api/activities"
//        AF.request(url).responseDecodable(of: [Activity].self) { response in
//            switch response.result {
//            case .success(let activities):
//                self.activities = activities
//            case .failure(let error):
//                print("Error fetching activities: \(error)")
//            }
//        }
    }
}
