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
            ScrollView {
                VStack(alignment: .leading) {
                    Text("기록하고 싶은 내용을 자유롭게 써주세요!")
                        .pretendardFont(.Regular, size: 18)
                        //.padding(.bottom, 10)
                    
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
                        .padding(.bottom, 10)
                    }
                    
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
                    //.padding(.horizontal, 30)
                    
                    Spacer()
                    
                    Button(action: {
                        onSave(mealRecord)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("메모 추가하기")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .padding()
                    //.padding(.horizontal, 30)
                    .padding(.bottom, 20)
                }
                .padding()
            }
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

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealRecord: MealRecord(type: "아침"), mealType: "아침", onSave: { _ in })
    }
}


