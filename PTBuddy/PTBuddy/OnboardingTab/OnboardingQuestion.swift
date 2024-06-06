//
//  OnboardingQuestion.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/6/24.
//

import Foundation

struct OnboardingQuestion: Identifiable {
    var id: Int
    var mainTitle: String
    var subTitle: String?
    var answers: [String]?
}

let onboardingQuestions = [
    OnboardingQuestion(id: 1, mainTitle: "이름을 알려주세요"),
    OnboardingQuestion(id: 2, mainTitle: "성별을 알려주세요", subTitle: "기초대사량 추정에 생물학적 성별에 따른 차이가 발생해요", answers: ["여성", "남성", "기타 - 생물학적 여성에 가까움", "기타 - 생물학적 남성에 가까움"]),
    OnboardingQuestion(id: 3, mainTitle: "생년월일을 입력해주세요"),
    OnboardingQuestion(id: 4, mainTitle: "키를 입력해주세요"),
    OnboardingQuestion(id: 5, mainTitle: "체중을 입력해주세요"),
    OnboardingQuestion(id: 6, mainTitle: "하루에 식사를 몇 끼 정도 먹나요?", subTitle: "아침, 아점, 점심 등 메인 식사 기준", answers: ["1끼", "2끼", "3끼", "4끼", "5끼 이상"]),
    OnboardingQuestion(id: 7, mainTitle: "식사 한 번에 보통 몇 인분씩 먹나요?", answers: ["0.5인분 미만", "0.5인분", "0.7인분", "1인분", "1.2인분", "1.5인분", "1.5인분 초과"]),
    OnboardingQuestion(id: 8, mainTitle: "탄수화물 섭취 횟수", subTitle: "밥, 빵, 면, 고구마, 과일 등의 탄수화물을 얼마나 자주 먹나요?(한끼 기준 주먹 1개 이상의 양을 먹은 횟수)", answers: ["매 식사마다", "하루 식사 중 절반", "하루 한 번 정도", "일주일에 3~4번 정도", "일주일에 1~2번 정도"]),
    OnboardingQuestion(id: 9, mainTitle: "단백질 섭취 횟수", subTitle: "달걀, 고기, 해산물, 유제품 등의 단백질을 얼마나 자주 먹나요?", answers: ["매 식사마다", "하루 식사 중 절반", "하루 한 번 정도", "일주일에 3~4번 정도", "일주일에 1~2번 정도"]),
    OnboardingQuestion(id: 10, mainTitle: "채소 섭취 횟수", subTitle: "채소는 얼마나 자주 먹나요?", answers: ["매 식사마다", "하루 식사 중 절반", "하루 한 번 정도", "일주일에 3~4번 정도", "일주일에 1~2번 정도"]),
    OnboardingQuestion(id: 11, mainTitle: "하루 물 섭취량", subTitle: "하루에 얼마나 많은 물을 마시나요?", answers: ["500ml 미만", "500ml~1L 미만", "1L 이상~1.2L 미만", "1.2L 이상~1.4L 미만", "1.4L 이상"]),
    OnboardingQuestion(id: 12, mainTitle: "술 섭취량", subTitle: "술을 얼마나 자주 마시나요?", answers: ["거의 먹지 않음", "일주일에 1~2번", "일주일에 3~4번", "일주일에 5번 이상"]),
    OnboardingQuestion(id: 13, mainTitle: "평소에 얼마나 움직이나요?", answers: ["매우 적은 수준", "가벼운 수준", "일반적인 수준", "매우 많은 수준"]),
    OnboardingQuestion(id: 14, mainTitle: "하루에 얼마나 걷나요?", answers: ["3,000걸음 미만", "5,000걸음 미만", "7,000걸음 미만", "10,000걸음 미만", "10,000걸음 이상"]),
    OnboardingQuestion(id: 15, mainTitle: "무릎대고 푸쉬업을 몇 개 할 수 있나요?", answers: ["10개 이하", "11~20개", "21개 이상", "잘 모르겠어요"]),
    OnboardingQuestion(id: 16, mainTitle: "규칙적으로 운동을 하고 있나요?", answers: ["처음이에요", "3개월 이내", "3-6개월", "6-12개월", "1년 이상"]),
    OnboardingQuestion(id: 17, mainTitle: "규칙적으로 하는 운동은 무엇인가요?", answers: ["헬스", "홈트", "크로스핏/HIIT/복싱", "필라테스/요가", "빠르게 걷기", "달리기", "실내 사이클/야외 자전거", "수영"]),
    OnboardingQuestion(id: 18, mainTitle: "일주일에 보통 며칠 운동하나요?", answers: ["1일", "2일", "3일", "4일", "5일", "6일", "7일"]),
    OnboardingQuestion(id: 18, mainTitle: "하루 보통 몇 시간 운동을 하나요?", answers: ["1시간 미만", "1시간 이상 2시간 미만", "2시간 이상 3시간 미만", "3시간 이상 4시간 미만", "4시간 이상 5시간 미만", "5시간 이상"]),
    OnboardingQuestion(id: 19, mainTitle: "코칭 시작 후, 운동량의 변화를 줄 예정인가요?", answers: ["유지할 예정", "늘릴 예정", "줄일 예정"]),
    OnboardingQuestion(id: 20, mainTitle: "목표 몸무게는 어떻게 되시나요?"),
    OnboardingQuestion(id: 21, mainTitle: "주요 목표는 무엇인가요?", answers: ["근육 증가", "체지방 감소", "현재 상태 유지"]),
    OnboardingQuestion(id: 22, mainTitle: "주로 어디서 운동하나요?", answers: ["헬스장", "집"]),
    OnboardingQuestion(id: 23, mainTitle: "어떤 운동을 선호하나요?", answers: ["맨몸 운동", "기구 운동"]),
    OnboardingQuestion(id: 24, mainTitle: "일주일에 몇 번 운동하실 예정인가요?", answers: ["1일", "2일", "3일", "4일", "5일", "6일", "7일"])
]
