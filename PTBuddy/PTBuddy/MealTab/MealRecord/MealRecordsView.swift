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
    @State private var showImagePicker: Bool = false
    @State private var showCameraPicker: Bool = false
<<<<<<< HEAD
    @State private var showAlert: Bool = false
    @State private var showEditMealView: Bool = false
    @State private var editMealRecord: MealRecord?
=======
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
    
    @Query private var meals: [MealRecord]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("식사기록")
                .pretendardFont(.Bold, size: 25)
                .padding(.bottom, 20)
                .padding(.horizontal, 20) // 좌우 패딩을 줄임
            
            ForEach(["아침", "점심", "저녁", "간식"], id: \.self) { mealType in
                VStack(alignment: .leading) {
<<<<<<< HEAD
                    VStack(alignment: .leading) {
                        HStack {
                            Text(mealType)
                                .pretendardFont(.Bold, size: 20)
                                .padding(8)
                            
                            Spacer()
                            
                            Button(action: {
                                selectedMealType = mealType
                                showActionSheet = true
                            }) {
                                Image(systemName: "plus")
                                    .padding()
                                    .foregroundColor(.black)
=======
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
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
                            }
                        }
                        .background(Color.white)
                        .padding(.horizontal, 20) // 좌우 패딩을 줄임
                        
                        if let mealRecord = meals.first(where: { $0.type == mealType }) {
                            HStack {
                                if !mealRecord.images.isEmpty, let imageData = mealRecord.images.first, let image = UIImage(data: imageData) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 80)
                                        .padding(.bottom, 10)
                                }
                                
                                if !mealRecord.notes.isEmpty {
                                    Text(mealRecord.notes)
                                        .pretendardFont(.Regular, size: 16)
                                        .padding()
                                        .frame(width: 180, height: 80) // 고정된 크기 설정
                                        .background(Color.orange.opacity(0.3))
                                        .cornerRadius(20) // 동일한 코너 반경
                                        .padding(.horizontal, 10)
                                        .onTapGesture {
                                            editMealRecord = mealRecord
                                            showEditMealView = true
                                        }
                                } else {
                                    Text("")
                                        .padding()
                                        .frame(width: 100, height: 80) // 고정된 크기 설정
                                        .background(Color.orange.opacity(0.3))
                                        .cornerRadius(20) // 동일한 코너 반경
                                        .padding(.horizontal, 10)
                                }
                            }
                            .padding(.horizontal, 20) // 좌우 패딩을 줄임
                            .padding(.bottom, 10)
                        }
                    }
                    .background(Color.white)
<<<<<<< HEAD
                    .cornerRadius(20)
=======
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
<<<<<<< HEAD
                    .padding(.horizontal, 20) // 좌우 패딩을 줄임
                    .padding(.bottom, 5)
=======
                    .padding(.horizontal, 30)
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
                }
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
<<<<<<< HEAD
                    if let mealType = selectedMealType, let _ = meals.first(where: { $0.type == mealType }) {
                        showAlert = true
                    } else {
                        showAddMealView = true
                    }
=======
                    showAddMealView = true
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
                },
                .destructive(Text("취소"))
            ])
        }
<<<<<<< HEAD
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("메모 수정"),
                message: Text("이전 메모를 수정하시겠습니까?"),
                primaryButton: .default(Text("수정하기"), action: {
                    if let mealType = selectedMealType, let mealRecord = meals.first(where: { $0.type == mealType }) {
                        editMealRecord = mealRecord
                        showEditMealView = true
                    }
                }),
                secondaryButton: .cancel(Text("취소"))
            )
        }
        .sheet(isPresented: $showAddMealView) {
            if let mealType = selectedMealType {
                AddMealView(mealType: mealType) { newMealRecord in
                    if let existingMeal = meals.first(where: { $0.type == mealType }) {
                        withAnimation {
                            existingMeal.notes = newMealRecord.notes
                            if !newMealRecord.images.isEmpty {
                                existingMeal.images = newMealRecord.images
                            }
                            do {
                                try context.save()
                            } catch {
                                print("Failed to save context: \(error.localizedDescription)")
                            }
                        }
                    } else {
                        withAnimation {
                            context.insert(newMealRecord)
                            do {
                                try context.save()
                            } catch {
                                print("Failed to save context: \(error.localizedDescription)")
                            }
=======
        .sheet(isPresented: $showAddMealView) {
            if let mealType = selectedMealType {
                AddMealView(mealType: mealType) { newMealRecord in
                    withAnimation {
                        context.insert(newMealRecord)
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
                        }
                    }
                    showAddMealView = false
                }
            }
        }
<<<<<<< HEAD
        .sheet(isPresented: $showEditMealView) {
            if let mealRecord = editMealRecord {
                EditMealView(mealRecord: mealRecord) { updatedMealRecord in
                    withAnimation {
                        mealRecord.notes = updatedMealRecord.notes
                        if !updatedMealRecord.images.isEmpty {
                            mealRecord.images = updatedMealRecord.images
                        }
=======
        .sheet(isPresented: $showMealDetailView) {
            if let mealType = selectedMealType, let mealRecord = meals.first(where: { $0.type == mealType }) {
                MealDetailView(mealRecord: mealRecord, mealType: mealType) { updatedMealRecord in
                    withAnimation {
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
                        }
                    }
<<<<<<< HEAD
                    showEditMealView = false
=======
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
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
<<<<<<< HEAD
                            mealRecord.images = [selectedImage.jpegData(compressionQuality: 1.0)!]
=======
                            mealRecord.images.append(selectedImage.jpegData(compressionQuality: 1.0)!)
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
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
<<<<<<< HEAD
                            mealRecord.images = [selectedImage.jpegData(compressionQuality: 1.0)!]
=======
                            mealRecord.images.append(selectedImage.jpegData(compressionQuality: 1.0)!)
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
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

<<<<<<< HEAD:PTBuddy/PTBuddy/MealTab/MealRecordsView.swift
<<<<<<< HEAD

=======
>>>>>>> ce87e90 (✨ :: MealTab에 SwiftData 적용 #15 | fix conflict)
=======
>>>>>>> 5eefa36 (🎨 :: SafeArea에 View침범 못하게 수정, font 수정 #5):PTBuddy/PTBuddy/MealTab/MealRecord/MealRecordsView.swift
