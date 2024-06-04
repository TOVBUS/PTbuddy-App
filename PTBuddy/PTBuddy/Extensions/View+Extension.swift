//
//  View+Extension.swift
//  PTBuddy
//
//  Created by DOYEON JEONG on 6/4/24.
//

import SwiftUI

enum PretendardType: String {
    case Black = "Pretendard-Black"
    case Bold = "Pretendard-Bold"
    case ExtraBold = "Pretendard-ExtraBold"
    case ExtraLight = "Pretendard-ExtraLight"
    case Light = "Pretendard-Light"
    case Medium = "Pretendard-Medium"
    case Regular = "Pretendard-Regular"
    case SemiBold = "Pretendard-SemiBold"
    case Thin = "Pretendard-Thin"
}

extension View {
    func pretendardFont(_ type: PretendardType, size: CGFloat) -> some View {
        self.font(.custom(type.rawValue, size: size))
    }
}
