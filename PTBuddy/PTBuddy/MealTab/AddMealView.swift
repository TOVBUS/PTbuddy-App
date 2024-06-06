//
//  AddMealView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct AddMealView: View {
    
    @State var mealRecord: MealRecord
    let mealType: String
    var onSave: (MealRecord) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("기록하고 싶은 내용을 자유롭게 써주세요!")
                    .pretendardFont(.Regular, size: 18)
                    .padding(.bottom, 10)
                
                ZStack {
                    Color.orange.opacity(0.5)
                        .cornerRadius(10)
                    TextEditor(text: $mealRecord.notes)
                        .padding()
                        .background(Color.clear)
                }
                .frame(maxHeight: 300)
                
                Spacer()
            }
            .padding()
            .navigationTitle("식단메모")
            .pretendardFont(.Bold, size: 20)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
            }
            .onChange(of: mealRecord.notes) { newValue in
                onSave(MealRecord(notes: newValue, type: mealType))
            }
        }
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView(mealRecord: MealRecord(type: "아침"), mealType: "아침") { _ in }
    }
}
