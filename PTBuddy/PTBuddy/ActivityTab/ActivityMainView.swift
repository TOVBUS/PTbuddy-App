//
//  ActivityMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct ActivityMainView: View {
    @StateObject private var activityVM = ActivityViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // MARK: CustomHeader
                HStack {
                    Text("운동")
                        .pretendardFont(.Bold, size: 26)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                
                Section {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 2)
                            .frame(height: 64)
                        
                        ProgressView(value: Float(activityVM.completedWorkouts), total: Float(activityVM.weeklyGoal))
                            .progressViewStyle(LinearProgressViewStyle(tint: .orange))
                            .padding()
                    }
                    .padding(.vertical, 20)
                } header: {
                    HStack {
                        Text("주간 목표")
                            .pretendardFont(.Black, size: 18)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 30)
                
                Section {
                    VStack {
                        HStack {
                            // 첫 번째 버튼
                            NavigationLink(destination: ActivityRoutineListView()) {
                                HStack {
                                    Text("부위")
                                        .pretendardFont(.Medium, size: 14)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("상체")
                                        .pretendardFont(.Bold, size: 14)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 100, height: 40)
                                .background(Capsule().fill(Color.gray))
                            }
                            
                            // 두 번째 버튼
                            Button(action: {
                                // 버튼 액션
                            }) {
                                HStack {
                                    Text("시간")
                                        .pretendardFont(.Medium, size: 14)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("30분")
                                        .pretendardFont(.Bold, size: 14)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 100, height: 40)
                                .background(Capsule().fill(Color.gray))
                            }
                            
                            // 세 번째 버튼
                            Button(action: {
                                // 버튼 액션
                            }) {
                                HStack {
                                    Text("컨디션")
                                        .pretendardFont(.Medium, size: 14)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("100%")
                                        .pretendardFont(.Bold, size: 14)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 120, height: 40)
                                .background(Capsule().fill(Color.gray))
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    
                    List(activityVM.activities) { activity in
                        HStack {
                            // TODO: need to change for thumbnail
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.gray)
                            Text(activity.title)
                                .pretendardFont(.Medium, size: 18)
                        }
                    }
                    .listStyle(PlainListStyle())
                } header: {
                    HStack {
                        Text("체지방 감소 추천 플랜 (초급)")
                            .pretendardFont(.Black, size: 18)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                Button(action: {
                    // 버튼 액션
                }) {
                    Text("운동 시작하기")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    ActivityMainView()
        .environmentObject(ActivityViewModel())
}
