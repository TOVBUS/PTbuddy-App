//
//  MealDetailView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct MealDetailView: View {
    
    @State var mealRecord: MealRecord
    let mealType: String
    var onSave: (MealRecord) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                Text("기록하고 싶은 내용을 자유롭게 써주세요!")
                                    .pretendardFont(.Regular, size: 18)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(mealRecord.images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipped()
                        }
                    }
                }
                
                TextEditor(text: $mealRecord.notes)
                    .pretendardFont(.Regular, size: 18)
                    .frame(height: 300)
                    .padding()
                    .background(Color.orange.opacity(0.5))
                    .cornerRadius(20)
                    .onChange(of: mealRecord.notes) { newValue in
                        onSave(MealRecord(notes: newValue, type: mealType))
                    }
                
                Spacer()
            }
            .padding()
            .navigationTitle("식단 메모")
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
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealRecord: MealRecord(type: "아침"), mealType: "아침", onSave: { _ in })
    }
}

