//
//  MealRecordModel.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import Foundation
import SwiftData

@Model
final class MealRecord: Identifiable {
    var id = UUID()
    var images: [Data] = [] // UIImage를 저장하려면 Data 타입으로 변환합니다.
    var notes: String = ""
    var type: String
    
    init(type: String, notes: String = "", images: [Data] = []) {
        self.type = type
        self.notes = notes
        self.images = images
    }
}

