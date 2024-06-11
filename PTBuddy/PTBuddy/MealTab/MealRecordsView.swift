//
//  MealRecordsView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/7/24.
//

import SwiftUI
import SwiftData

struct MealRecordsView: View {
    
    @Environment(\.modelContext) private var context
    @State private var selectedMealType: String?
    @State private var selectedImage: UIImage?
    @State private var showActionSheet: Bool = false
    @State private var showAddMealView: Bool = false
    @State private var showMealDetailView: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var showCameraPicker: Bool = false
    
    @Query private var meals: [MealRecord]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("식사기록")
                .pretendardFont(.Bold, size: 25)
                .padding(.bottom, 20)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            
            ForEach(["아침", "점심", "저녁", "간식"], id: \.self) { mealType in
                VStack(alignment: .leading) {
                    HStack {
                        Text(mealType)
                            .pretendardFont(.Bold, size: 20)
                            .padding(8)
                            .onTapGesture {
                                selectedMealType = mealType
                                if let mealRecord = meals.first(where: { $0.type == mealType }), !mealRecord.notes.isEmpty || !mealRecord.images.isEmpty {
                                    showMealDetailView = true
                                } else {
                                    showAddMealView = true
                                }
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
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal, 30)
                }
                .padding(.bottom, 5)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("옵션 선택"), buttons: [
                .default(Text("사진찍기")) {
                    showCameraPicker = true
                },
                .default(Text("앨범에서 추가하기")) {
                    showImagePicker = true
                },
                .default(Text("메모하기")) {
                    showAddMealView = true
                },
                .destructive(Text("취소"))
            ])
        }
        .sheet(isPresented: $showAddMealView) {
            if let mealType = selectedMealType {
                AddMealView(mealType: mealType) { newMealRecord in
                    withAnimation {
                        context.insert(newMealRecord)
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
                        }
                    }
                    showAddMealView = false
                }
            }
        }
        .sheet(isPresented: $showMealDetailView) {
            if let mealType = selectedMealType, let mealRecord = meals.first(where: { $0.type == mealType }) {
                MealDetailView(mealRecord: mealRecord, mealType: mealType) { updatedMealRecord in
                    withAnimation {
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
                .onDisappear {
                    if let selectedImage = selectedImage,
                       let mealType = selectedMealType,
                       let mealRecord = meals.first(where: { $0.type == mealType }) {
                        withAnimation {
                            mealRecord.images.append(selectedImage.jpegData(compressionQuality: 1.0)!)
                            do {
                                try context.save()
                            } catch {
                                print("Failed to save context: \(error.localizedDescription)")
                            }
                        }
                    }
                }
        }
        .sheet(isPresented: $showCameraPicker) {
            ImagePicker(image: $selectedImage, sourceType: .camera)
                .onDisappear {
                    if let selectedImage = selectedImage,
                       let mealType = selectedMealType,
                       let mealRecord = meals.first(where: { $0.type == mealType }) {
                        withAnimation {
                            mealRecord.images.append(selectedImage.jpegData(compressionQuality: 1.0)!)
                            do {
                                try context.save()
                            } catch {
                                print("Failed to save context: \(error.localizedDescription)")
                            }
                        }
                    }
                }
        }
    }
}

struct MealRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        MealRecordsView()
            .modelContainer(for: MealRecord.self, inMemory: true) // Preview용 inMemory 설정
    }
}

