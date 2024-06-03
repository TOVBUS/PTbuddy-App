//
//  AddMealView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/3/24.
//

import SwiftUI

struct AddMealView: View {
    let mealType: String
    @State private var mealNotes: String = ""
    var onSave: (MealRecord) -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextEditor(text: $mealNotes)
                    .frame(height: 200)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("\(mealType) 추가")
            .navigationBarItems(leading: Button("취소") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("저장") {
                onSave(MealRecord(notes: mealNotes))
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView(mealType: "아침") { _ in }
    }
}

