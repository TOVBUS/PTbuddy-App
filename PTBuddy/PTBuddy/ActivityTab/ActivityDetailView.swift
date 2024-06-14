//
//  ActivityDetailView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: Activity
    
    var body: some View {
        VStack {
            ScrollView {
                ActivityDetailRowView(activity: activity)
                
                HStack {
                    VStack {
                        Text("💪🏻 이곳을 운동해요!")
                            .pretendardFont(.SemiBold, size: 20)
                            .padding(.bottom, 8)
                        
                        if let imageUrl = activity.muscleImage, let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 120)
                            } placeholder: {
                                GifImage("loading").background(Color(.red))
                                    .frame(width: 120, height: 120, alignment: .center)
                                    .padding()
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
            }
            .scrollIndicators(.hidden)
            
            NavigationLink(destination: ActivityFinishView().environmentObject(NavigationPathFinder.shared)) {
                            Text("운동 완료하기")
                                .pretendardFont(.SemiBold, size: 18)
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

#Preview {
    ActivityDetailView(activity: Activity(id: "ab-wheel-rollout", activityTitle: "Ab Wheel Rollout", proTip: "To avoid discomfort in your knees, try to avoid kneeling.", howTo: "Position yourself on your knees with your feet lifted.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-LOWER_transparent.png", equipment: "Ab Wheel", videoURL: "https://app.fitnessai.com/exercises/23321201-Wheel-Rollout-female-Waist.mp4"))
}
