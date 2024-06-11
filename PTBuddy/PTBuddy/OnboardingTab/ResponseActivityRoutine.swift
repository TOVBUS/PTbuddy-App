//
//  ResponseActivityRoutine.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/11/24.
//

import Foundation

struct ResponseActivityRoutine: Codable {
    let success: Bool
    let responses: [String]
    let message: String
}
