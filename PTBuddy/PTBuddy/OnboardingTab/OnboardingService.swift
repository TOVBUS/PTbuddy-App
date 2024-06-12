//
//  OnboardingService.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation
import Combine
import Alamofire

class OnboardingService {
    static let shared = OnboardingService()

    func getActivityRoutine(_ onboardingMemberInfo: OnboardingMemberInfo) -> AnyPublisher<ActivityRoutineRoot, AFError> {
        let url = "http://localhost:3001/ai/activity-routine"
        return AF.request(url, method: .post, parameters: onboardingMemberInfo, encoder: JSONParameterEncoder.default)
            .publishDecodable(type: ActivityRoutineRoot.self)
            .value()
//            .map {
//                do {
//                    if let data = $0.responses[0].data(using: .utf8) {
//                        let data = try JSONDecoder().decode(ActivityWeeklyRoutine.self, from: data)
//                        print(data)
//                    } else {
//
//                    }
//                }
//                catch {
//                    print(error.localizedDescription)
//                }
//            }
            .eraseToAnyPublisher()
    }
}
