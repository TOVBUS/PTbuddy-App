//
//  BasicInfo.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/5/24.
//

import Foundation

class BasicInfo: ObservableObject, Codable {
    @Published var nick: String
    @Published var gender: String
    @Published var birth: String
    @Published var height: String
    @Published var weight: String

    init(nick: String, gender: String, birth: String, height: String, weight: String) {
        self.nick = nick
        self.gender = gender
        self.birth = birth
        self.height = height
        self.weight = weight
    }

    enum CodingKeys: String, CodingKey {
        case nick, gender, birth, height, weight
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nick = try container.decode(String.self, forKey: .nick)
        gender = try container.decode(String.self, forKey: .gender)
        birth = try container.decode(String.self, forKey: .birth)
        height = try container.decode(String.self, forKey: .height)
        weight = try container.decode(String.self, forKey: .weight)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nick, forKey: .nick)
        try container.encode(gender, forKey: .gender)
        try container.encode(birth, forKey: .birth)
        try container.encode(height, forKey: .height)
        try container.encode(weight, forKey: .weight)
    }
}
