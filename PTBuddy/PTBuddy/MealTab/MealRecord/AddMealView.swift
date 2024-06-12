//
//  AddMealView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI
import SwiftData

struct AddMealView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.presentationMode) var presentationMode
    @State var mealType: String
    @State var mealRecord = MealRecord(type: "")
    
    var onSave: (MealRecord) -> Void
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("기록하고 싶은 내용을 자유롭게 써주세요!")
                    .pretendardFont(.Regular, size: 18)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange.opacity(0.5))
                    TextEditor(text: $mealRecord.notes)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .pretendardFont(.Regular, size: 18)
                        .padding()
                }
                .frame(height: 500)
                .padding()
                
                Spacer()
                
                Button(action: {
                    mealRecord.type = mealType
                    withAnimation {
                        context.insert(mealRecord)
                        do {
                            try context.save()
                            onSave(mealRecord)
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Text("메모 추가하기")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationTitle("식단메모")
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
        }
    }
}



