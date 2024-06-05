//
//  BasicInfo.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

class BasicInfo: ObservableObject {
    @Published var nick: String
    @Published var gender: String
    @Published var birth: String
    @Published var height: Float
    @Published var weight: Float

    init(nick: String, gender: String, birth: String, height: Float, weight: Float) {
        self.nick = nick
        self.gender = gender
        self.birth = birth
        self.height = height
        self.weight = weight
    }
}
