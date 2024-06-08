//
//  OnboardingDatePickerView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/9/24.
//

import SwiftUI

struct OnboardingDatePickerView: View {
    @Binding var selectedDateString: String
    @State var selectedDate: Date = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -100, to: Date()) ?? Date()
    let endDate = Date()

    var body: some View {
        VStack {
            DatePicker("생년월일", selection: $selectedDate, in: startDate...endDate,  displayedComponents: .date)
                .onChange(of: selectedDate, { oldValue, newValue in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy년 MM월 dd일"
                    selectedDateString = formatter.string(from: newValue)
                })
                .datePickerStyle(.wheel)
                .labelsHidden()
                .environment(\.locale, Locale(identifier: "ko_KR"))
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.orange, lineWidth: 2.0)
                )
        }
    }
}

//#Preview {
//    OnboardingDatePickerView(selectedDateString: <#Binding<String>#>)
//}
