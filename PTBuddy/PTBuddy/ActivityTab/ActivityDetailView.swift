//
//  ActivityDetailView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/12/24.
//

import SwiftUI

struct ActivityDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var isPresented = false
    var activitySet: String = "1세트"
    
    var body: some View {
        VStack {
            HStack {
                Text("랫 풀다운")
                    .pretendardFont(.Bold, size: 26)
                
                Spacer()
            }//: HStack
            .padding(.leading, 20)
            
            Image("lat-pulldown")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
                .padding()
            
            ScrollView {
                ActivityDetailRow(activitySet: "1세트", activityKg: "20kg", activityReps: "15회")
                ActivityDetailRow(activitySet: "2세트", activityKg: "20kg", activityReps: "15회")
                ActivityDetailRow(activitySet: "3세트", activityKg: "20kg", activityReps: "15회")
                
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "pencil")
                            .foregroundStyle(.black)
                        Text("세트 수정")
                            .foregroundStyle(.black)
                            .pretendardFont(.SemiBold, size: 18)
                    })//: Button
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                        Text("세트 추가")
                            .foregroundStyle(.black)
                            .pretendardFont(.SemiBold, size: 18)
                    })//: Button
                    .frame(maxWidth: .infinity)
                    .padding(14)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }//: HStack
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
            }
            
            HStack {
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("휴식")
                        .foregroundStyle(.white)
                        .pretendardFont(.Bold, size: 18)
                })//: Button
                .frame(width: 50)
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .foregroundStyle(.orange)
                        
                )
                .sheet(isPresented: $isPresented) {
                    RestTimeModalView()
                        .presentationDetents([.fraction(0.9)])
                        .presentationDragIndicator(.visible)
                }
                
                Button(action: {}, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                    Text("\(activitySet) 완료")
                        .foregroundStyle(.white)
                        .pretendardFont(.Bold, size: 18)
                })//: Button
                .frame(maxWidth: .infinity)
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .foregroundStyle(.orange)
                )
            }//: HStack
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
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
        }//: VStack
    }
}

#Preview {
    ActivityDetailView()
}

struct ActivityDetailRow: View {
    var activitySet: String
    var activityKg: String
    var activityReps: String
    var body: some View {
        HStack {
            Text(activitySet)
                .pretendardFont(.SemiBold, size: 18)
                .frame(width: 50)
            
            Text(activityKg)
                .pretendardFont(.SemiBold, size: 18)
                .frame(width: 100)
            
            Text("/")
                .pretendardFont(.SemiBold, size: 18)
            
            Text(activityReps)
                .pretendardFont(.SemiBold, size: 18)
                .frame(width: 100)
        }//: HStack
        .frame(maxWidth: .infinity)
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
}
