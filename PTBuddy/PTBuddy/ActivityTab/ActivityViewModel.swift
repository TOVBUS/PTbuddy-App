//
//  ActivityViewModel.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/7/24.
//

import SwiftUI
import Combine
import Alamofire

class ActivityViewModel: ObservableObject {
    @Published var activities: [Activity] = []
    @Published var routines: [Routine] = []
    @Published var weeklyGoal: Int = 7
    @Published var completedWorkouts: Int = 3
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchActivities()
        fetchRoutines()
    }
    
    func fetchActivities() {
        
    }
    
    // TODO: 온보딩 서비스에서 호출하면 이거 필요없음
    func fetchRoutines() {
        let url = "http://localhost:3000/routine/generate"
//        let parameters: [String: Any] = [ ? ]
        
//        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .responseDecodable(of: RoutineResponse.self) { response in
//                switch response.result {
//                    case .success(let routineResponse):
//                        let parsedRoutines = self.parseResponse(response: routineResponse.responses)
//                        DispatchQueue.main.async {
//                            self.routines = parsedRoutines
//                        }
//                    case .failure(let error):
//                        print(error)
//                }
//            }
    }
    
    private func parseResponse(response: String) -> [Routine] {
        let lines = response.components(separatedBy: "||")
        
        for line in lines {
            let fields = line.components(separatedBy: "|")
            var day = ""
            var exerciseArea = ""
            var exerciseNameEN = ""
            var exerciseNameKR = ""
            var reps: String? = nil
            var sets: String? = nil
            var weight: String? = nil
            var duration: String? = nil
            
            for field in fields {
                let pair = field.components(separatedBy: ":")
                if pair.count == 2 {
                    let key = pair[0]
                    let value = pair[1]
                    
                    switch key {
                        case "요일":
                            day = value
                        case "부위":
                            exerciseArea = value
                        case "이름(영어)":
                            exerciseNameEN = value
                        case "이름(한글)":
                            exerciseNameKR = value
                        case "횟수":
                            reps = value == "null" ? nil : value
                        case "세트":
                            sets = value == "null" ? nil : value
                        case "무게(kg)":
                            weight = value == "null" ? nil : value
                        case "시간(초)":
                            duration = value == "null" ? nil : value
                        default:
                            break
                    }
                }
            }
            
            let routine = Routine(
                id: "String", // TODO: API에서 넘겨줄거임
                day: day,
                exerciseArea: exerciseArea,
                exerciseNameEN: exerciseNameEN,
                exerciseNameKR: exerciseNameKR,
                reps: reps,
                sets: sets,
                weight: weight,
                duration: duration
            )
            routines.append(routine)
        }
        
        return routines
    }
}
