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
    
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60 // 요청 타임아웃을 60초로 설정
        configuration.timeoutIntervalForResource = 60 // 자원 타임아웃을 60초로 설정
        self.session = Session(configuration: configuration)
    }

    func getActivityRoutine(_ onboardingMemberInfo: OnboardingMemberInfo) -> AnyPublisher<ActivityRoutineRoot, AFError> {
        let url = "http://localhost:3001/ai/activity-routine"
        return session.request(url, method: .post, parameters: onboardingMemberInfo, encoder: JSONParameterEncoder.default)
            .publishDecodable(type: ActivityRoutineRoot.self)
            .value()
            .eraseToAnyPublisher()
    }
}
