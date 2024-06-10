//
//  MealRecordModel.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct MealRecord: Identifiable {
    let id = UUID()
    var images: [UIImage] = []
    var notes: String = ""
    let type: String
}
