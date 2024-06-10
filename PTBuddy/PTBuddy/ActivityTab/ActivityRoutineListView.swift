//
//  ActivityRoutineListView.swift
//  PTBuddy
//
//  Created by DOYEON JEONG on 6/9/24.
//

import SwiftUI

struct ActivityRoutineListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("어떤 루틴으로\n추천해드릴까요?")
                    .pretendardFont(.Bold, size: 26)
                    .padding(.top, 24)
                
                Text("회원님의 일주일 운동 계획에 맞게\n원하는 루틴을 선택해서 운동을 진행해보세요!")
                    .pretendardFont(.Medium, size: 16)
                    .padding(.top, 16)
                
                VStack {
                    ActivityRoutineRow(title: "상체", activities: ["등", "가슴", "어깨", "유산소"])
                        .padding(.bottom, 16)
                    ActivityRoutineRow(title: "하체", activities: ["허벅지", "종아리", "힙", "유산소"])
                        .padding(.bottom, 16)
                    ActivityRoutineRow(title: "복합", activities: ["하체", "이두", "삼두", "코어"])
                }
                .padding(.top, 16)
                
                Spacer()
            }
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            
            Button(action: {
                // 버튼 액션
            }) {
                Text("선택하기")
                    .pretendardFont(.SemiBold, size: 18)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    ActivityRoutineListView()
}
