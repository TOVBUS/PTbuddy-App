//
//  MealDetailView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/3/24.
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
                .padding(.bottom, 10)
                
                TextEditor(text: $mealRecord.notes)
                    .frame(height: 100)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .navigationTitle("\(mealType) 기록")
            .navigationBarItems(leading: Button("취소") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: HStack {
                Button("삭제") {
                    mealRecord = MealRecord()
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.red)

                Button("저장") {
                    onSave(mealRecord)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealRecord: MealRecord(), mealType: "아침", onSave: { _ in })
    }
}

