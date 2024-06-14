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

    func getActivityRoutine(_ onboardingMemberInfo: OnboardingMemberInfo) -> AnyPublisher<RoutineResponse, AFError> {
        let url = "http://localhost:3000/routine/generate"
        return session.request(url, method: .post, parameters: onboardingMemberInfo, encoder: JSONParameterEncoder.default)
            .publishDecodable(type: RoutineResponse.self)
            .value()
            .eraseToAnyPublisher()
    }
    
    // TODO: 식단 루틴 받아오는걸로 수정해야됨
    func getMealRoutine(_ onboardingMemberInfo: OnboardingMemberInfo) -> AnyPublisher<ActivityRoutineRoot, AFError> {
        let url = "https://localhost:3000/routine/generate"
        return session.request(url, method: .post, parameters: onboardingMemberInfo, encoder: JSONParameterEncoder.default)
            .publishDecodable(type: ActivityRoutineRoot.self)
            .value()
            .eraseToAnyPublisher()
    }
}
