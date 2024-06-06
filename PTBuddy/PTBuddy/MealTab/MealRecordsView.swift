//
//  MealRecordsView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI

struct MealRecordsView: View {
    
    @State private var meals: [String: MealRecord] =
    [
        "아침": MealRecord(type: "아침"),
        "점심": MealRecord(type: "점심"),
        "저녁": MealRecord(type: "저녁"),
        "간식": MealRecord(type: "간식")
    ]
    
    @State private var selectedMealType: String?
    @State private var selectedImage: UIImage?
    @State private var showActionSheet: Bool = false
    @State private var showAddMealView: Bool = false
    @State private var showMealDetailView: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var showCarmeraPicker: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("식사기록")
                .pretendardFont(.Bold, size: 25)
                .padding(.bottom, 20)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            ForEach(["아침", "점심", "저녁", "간식"], id: \.self){
                mealType in
                VStack(alignment: .leading){
                    HStack{
                        Text(mealType)
                            .pretendardFont(.Bold, size: 20)
                            .padding(8)
                            .onTapGesture {
                                selectedMealType = mealType
                                showMealDetailView = true
                            }
                        
                        Spacer()
                        
                        Button(action: {
                            selectedMealType = mealType
                            showActionSheet = true
                        }) {
                            Image(systemName: "plus")
                                .padding()
                                .foregroundColor(.black)
                        }
                    }
                    .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                                .padding(.horizontal, 30)
                }
                .padding(.bottom, 5)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("옵션 선택"), buttons: [
                .default(Text("사진찍기")){
                    showCarmeraPicker = true
                },
                .default(Text("앨범에서 추가하기")){
                    showImagePicker = true
                },
                .default(Text("메모하기")){
                    showAddMealView = true
                },
                .destructive(Text("취소"))
            ])
        }
        .sheet(isPresented: $showAddMealView){
            if let mealType = selectedMealType{
                AddMealView(mealRecord: meals[mealType]!, mealType: mealType) { newMealRecord in
                    meals[mealType] = newMealRecord
                    showAddMealView = false
                }
            }
        }
        .sheet(isPresented: $showMealDetailView) {
            if let mealType = selectedMealType{
                MealDetailView(mealRecord: meals[mealType]!, mealType: mealType){
                    updatedMealRecord in
                    meals[mealType] = updatedMealRecord
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
                .onDisappear{
                    if let selectedImage = selectedImage, let mealType = selectedMealType{
                        meals[mealType]?.images.append(selectedImage)
                    }
                }
        }
            .sheet(isPresented: $showCarmeraPicker) {
                ImagePicker(image: $selectedImage, sourceType: .camera)
                    .onDisappear{
                        if let selectedImage = selectedImage,
                           let mealType = selectedMealType{
                            meals[mealType]?.images.append(selectedImage)
                        }
                    }
            }
    
    }
}

#Preview {
    MealRecordsView()
}
