//
//  MealRecordsView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/3/24.
//

import SwiftUI

struct MealRecordsView: View {
    @State private var meals: [String: MealRecord] = [
        "아침": MealRecord(),
        "점심": MealRecord(),
        "저녁": MealRecord(),
        "간식": MealRecord()
    ]
    @State private var selectedMealType: String?
    @State private var showActionSheet: Bool = false
    @State private var showAddMealView: Bool = false
    @State private var showMealDetailView: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var showCameraPicker: Bool = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack(alignment: .leading) {
            Text("식사기록")
                .font(.title)
            
            ForEach(["아침", "점심", "저녁", "간식"], id: \.self) { mealType in
                VStack(alignment: .leading) {
                    HStack {
                        Text(mealType)
                            .font(.title2)
                            .padding()
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
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(.bottom, 10)
            }
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("옵션 선택"), buttons: [
                .default(Text("카메라")) {
                    showCameraPicker = true
                },
                .default(Text("앨범")) {
                    showImagePicker = true
                },
                .default(Text("메모하기")) {
                    showAddMealView = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $showAddMealView) {
            if let mealType = selectedMealType {
                AddMealView(mealType: mealType) { newMealRecord in
                    meals[mealType] = newMealRecord
                    showAddMealView = false
                }
            }
        }
        .sheet(isPresented: $showMealDetailView) {
            if let mealType = selectedMealType {
                MealDetailView(mealRecord: meals[mealType]!, mealType: mealType) { updatedMealRecord in
                    meals[mealType] = updatedMealRecord
                }
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
                .onDisappear {
                    if let selectedImage = selectedImage, let mealType = selectedMealType {
                        meals[mealType]?.images.append(selectedImage)
                    }
                }
        }
        .sheet(isPresented: $showCameraPicker) {
            ImagePicker(image: $selectedImage, sourceType: .camera)
                .onDisappear {
                    if let selectedImage = selectedImage, let mealType = selectedMealType {
                        meals[mealType]?.images.append(selectedImage)
                    }
                }
        }
    }
}

struct MealRecordsView_Previews: PreviewProvider {
    static var previews: some View {
        MealRecordsView()
    }
}

struct MealRecord: Identifiable {
    let id = UUID()
    var images: [UIImage] = []
    var notes: String = ""
}

struct MealRecordView: View {
    var mealRecord: MealRecord

    var body: some View {
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
            Text(mealRecord.notes)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

