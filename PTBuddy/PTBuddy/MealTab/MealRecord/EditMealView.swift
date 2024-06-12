//
//  EditMealView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/11/24.
//

import SwiftUI
import SwiftData

struct EditMealView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.presentationMode) var presentationMode
    @Bindable var mealRecord: MealRecord
    
    var onSave: (MealRecord) -> Void
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("기존 메모를 수정하세요")
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
                .frame(height: 200)
                .padding()
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        do {
                            try context.save()
                            onSave(mealRecord)
                            presentationMode.wrappedValue.dismiss()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Text("메모 저장하기")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationTitle("메모 수정")
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

//struct EditMealView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditMealView(mealRecord: MealRecord(type: "아침")) { _ in }
//            .modelContainer(for: MealRecord.self, inMemory: true) // Preview용 inMemory 설정
//    }
//}



