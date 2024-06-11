//
//  ActivityRoutine.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation

struct ActivityRoutineSet {
    var count: Int
    var weight: Int
}

struct ActivityRoutineDetail {
    var activityTitle: String
    var activityTag: [String]
    var activityTime: String?
    var activityEquipment: [ActivityRoutineSet]?
}
