//
//  EatingHabit.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

struct EatingHabit: Codable {
    var mealCount: String
    var mealAmout: String
    var carbohydratePerMealCount: String
    var proteinPerMealCount: String
    var vegetablePerMealCount: String
    var waterIntakePerDay: String
    var alcoholIntake: String
}

//class EatingHabit: ObservableObject, Codable {
//    // 하루 메인 식사 개수 : 1끼, 2끼, 3끼, 4끼, 5끼
//    @Published var mealCount: String
//    // 평균 식사량 : 0.5인분, 0.7인분, 1인분, 1.2인분, 1.5인분, 1.5인분초과
//    @Published var mealAmout: String
//    // 탄수화물 섭취 횟수 밥, 빵, 면, 고구마, 과일 등의 탄수화물을 얼마나 자주 먹나요?(한끼 기준 주먹 1개 이상의 양을 먹은 횟수) : 매 식사마다, 하루 식사 중 절반, 하루 한 번 정도, 일주일에 3~4번 정도, 일주일에 1~2번 정도
//    @Published var carbohydratePerMealCount: String
//    // 달걀, 고기, 해산물, 유제품 들의 단백질을 얼마나 자주 먹나요?
//    @Published var proteinPerMealCount: String
//    // 채소는 얼마나 자주 먹나요?
//    @Published var vegetablePerMealCount: String
//    // 하루 물 섭취량 : 500ml 미만, 500ml~1L미만, 1L이상~1.2L미만, 1.2L이상~1.4L미만, 1.4L미만
//    @Published var waterIntakePerDay: String
//    // 술 섭취량 : 거의 먹지 않음, 일주일에 1~2번, 일주일에 3~4번, 일주일에 5번 이상
//    @Published var alcoholIntake: String
//
//    init(mealCount: String, mealAmout: String, carbohydratePerMealCount: String, proteinPerMealCount: String, vegetablePerMealCount: String, waterIntakePerDay: String, alcoholIntake: String) {
//        self.mealCount = mealCount
//        self.mealAmout = mealAmout
//        self.carbohydratePerMealCount = carbohydratePerMealCount
//        self.proteinPerMealCount = proteinPerMealCount
//        self.vegetablePerMealCount = vegetablePerMealCount
//        self.waterIntakePerDay = waterIntakePerDay
//        self.alcoholIntake = alcoholIntake
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case mealCount, mealAmout, carbohydratePerMealCount, proteinPerMealCount, vegetablePerMealCount, waterIntakePerDay, alcoholIntake
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        mealCount = try container.decode(String.self, forKey: .mealCount)
//        mealAmout = try container.decode(String.self, forKey: .mealAmout)
//        carbohydratePerMealCount = try container.decode(String.self, forKey: .carbohydratePerMealCount)
//        proteinPerMealCount = try container.decode(String.self, forKey: .proteinPerMealCount)
//        vegetablePerMealCount = try container.decode(String.self, forKey: .vegetablePerMealCount)
//        waterIntakePerDay = try container.decode(String.self, forKey: .waterIntakePerDay)
//        alcoholIntake = try container.decode(String.self, forKey: .alcoholIntake)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(mealCount, forKey: .mealCount)
//        try container.encode(mealAmout, forKey: .mealAmout)
//        try container.encode(carbohydratePerMealCount, forKey: .carbohydratePerMealCount)
//        try container.encode(proteinPerMealCount, forKey: .proteinPerMealCount)
//        try container.encode(vegetablePerMealCount, forKey: .vegetablePerMealCount)
//        try container.encode(waterIntakePerDay, forKey: .waterIntakePerDay)
//        try container.encode(alcoholIntake, forKey: .alcoholIntake)
//    }
//}
