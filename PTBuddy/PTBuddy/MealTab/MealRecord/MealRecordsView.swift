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
    @StateObject private var viewModel = MealRecordViewModel()

    @State private var selectedMealType: String?
    @State private var selectedImage: UIImage?
    @State private var showActionSheet: Bool = false
    @State private var showAddMealView: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var showCameraPicker: Bool = false
    @State private var showAlert: Bool = false
    @State private var showEditMealView: Bool = false
    @State private var editMealRecord: MealRecord?

    var body: some View {
        VStack(alignment: .leading) {
            Text("식사기록")
                .pretendardFont(.Bold, size: 25)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)

            ForEach(["아침", "점심", "저녁", "간식"], id: \.self) { mealType in
                VStack(alignment: .leading) {
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
                            }
                        }
                        .background(Color.white)
                        .padding(.horizontal, 20)

                        if let mealRecord = viewModel.mealRecords.first(where: { $0.type == mealType }) {
                            HStack {
                                if !mealRecord.images.isEmpty, let imageData = mealRecord.images.first, let image = UIImage(data: imageData) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 80)
                                        .padding(.bottom, 10)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                }

                                if !mealRecord.notes.isEmpty {
                                    Text(mealRecord.notes)
                                        .padding()
                                        .frame(width: 180, height: 80)
                                        .background(Color.orange.opacity(0.3))
                                        .cornerRadius(20)
                                        .padding(.horizontal, 10)
                                        .onTapGesture {
                                            editMealRecord = mealRecord
                                            showEditMealView = true
                                        }
                                } else {
                                    Text("")
                                        .padding()
                                        .frame(width: 100, height: 80)
                                        .background(Color.orange.opacity(0.3))
                                        .cornerRadius(20)
                                        .padding(.horizontal, 10)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 10)
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
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
                    if let mealType = selectedMealType, let _ = viewModel.mealRecords.first(where: { $0.type == mealType }) {
                        showAlert = true
                    } else {
                        showAddMealView = true
                    }
                },
                .destructive(Text("취소"))
            ])
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("메모 수정"),
                message: Text("이전 메모를 수정하시겠습니까?"),
                primaryButton: .default(Text("수정하기"), action: {
                    if let mealType = selectedMealType, let mealRecord = viewModel.mealRecords.first(where: { $0.type == mealType }) {
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
                    if let existingMeal = viewModel.mealRecords.first(where: { $0.type == mealType }) {
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
                        }
                    }
                    showAddMealView = false
                }
            }
        }
        .sheet(isPresented: $showEditMealView) {
            if let mealRecord = editMealRecord {
                EditMealView(mealRecord: mealRecord) { updatedMealRecord in
                    withAnimation {
                        mealRecord.notes = updatedMealRecord.notes
                        if !updatedMealRecord.images.isEmpty {
                            mealRecord.images = updatedMealRecord.images
                        }
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save context: \(error.localizedDescription)")
                        }
                    }
                    showEditMealView = false
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
                .onDisappear {
                    if let selectedImage = selectedImage,
                       let mealType = selectedMealType,
                       let mealRecord = viewModel.mealRecords.first(where: { $0.type == mealType }) {
                        withAnimation {
                            mealRecord.images = [selectedImage.jpegData(compressionQuality: 1.0)!]
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
                       let mealRecord = viewModel.mealRecords.first(where: { $0.type == mealType }) {
                        withAnimation {
                            mealRecord.images = [selectedImage.jpegData(compressionQuality: 1.0)!]
                            do {
                                try context.save()
                            } catch {
                                print("Failed to save context: \(error.localizedDescription)")
                            }
                        }
                    }
                }
        }
        .onAppear {
            viewModel.setContext(context)
        }
    }
}

struct MealRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        MealRecordsView()
            .modelContainer(for: MealRecord.self, inMemory: true) // Preview용 inMemory 설정
    }
}








