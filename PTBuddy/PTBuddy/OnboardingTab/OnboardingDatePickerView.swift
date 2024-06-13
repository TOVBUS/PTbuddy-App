//
//  OnboardingDatePickerView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/9/24.
//

import SwiftUI

struct OnboardingDatePickerView: View {
    @Binding var selectedDate: Date
    let startDate = Calendar.current.date(byAdding: .year, value: -100, to: Date()) ?? Date()
    let endDate = Date()
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }()

    var body: some View {
        VStack {
            DatePicker("생년월일", selection: $selectedDate, in: startDate...endDate, displayedComponents: .date)
                .datePickerStyle(.wheel)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ko_KR"))
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1.0)
                )
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    OnboardingDatePickerView(selectedDate: .constant(Date()))
}
