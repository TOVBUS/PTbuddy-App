//
//  CircularTimerView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/12/24.
//

import SwiftUI

struct CircularTimerView: View {
    var remainingTime: TimeInterval

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
                .foregroundColor(.blue)

            Circle()
                .trim(from: 0.0, to: CGFloat(min(remainingTime / 50.0, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: remainingTime)

            Text(remainingTime.convert())
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    CircularTimerView(remainingTime: TimeInterval())
}
