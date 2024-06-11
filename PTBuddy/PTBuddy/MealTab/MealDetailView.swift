//
//  MealDetailView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI
import SwiftData

struct MealDetailView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentationMode
    @Bindable var mealRecord: MealRecord
    let mealType: String
    var onSave: (MealRecord) -> Void
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("기록하고 싶은 내용을 자유롭게 써주세요!")
                        .pretendardFont(.Regular, size: 18)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(mealRecord.images, id: \.self) { imageData in
                                if let image = UIImage(data: imageData) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .clipped()
                                }
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
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            do {
                                try context.save() // 데이터 저장
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



