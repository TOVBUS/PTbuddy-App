//
//  ActivityDetailRowView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/14/24.
//

import SwiftUI
import AVKit

struct ActivityDetailRowView: View {
    let activity: Activity
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(activity.activityTitle)
                .pretendardFont(.Bold, size: 24)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            
            if let videoURL = activity.videoURL, let url = URL(string: videoURL) {
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
            }
            
            if let proTip = activity.proTip {
                HStack {
                    VStack(alignment: .leading) {
                        Text("🍯 운동 팁")
                            .pretendardFont(.SemiBold, size: 20)
                            .padding(.bottom, 8)
                        ScrollView {
                            Text(proTip)
                                .pretendardFont(.Regular, size: 16)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .scrollIndicators(.hidden)
                        }
                        .frame(height: 80)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
            if let howTo = activity.howTo {
                HStack {
                    VStack(alignment: .leading) {
                        Text("🧐 어떻게 하나요?")
                            .pretendardFont(.SemiBold, size: 20)
                            .padding(.bottom, 8)
                        ScrollView {
                            Text(howTo)
                                .pretendardFont(.Regular, size: 16)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .scrollIndicators(.hidden)
                        }
                        .frame(height: 80)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    ActivityDetailRowView(activity: Activity(id: "ab-wheel-rollout", activityTitle: "Ab Wheel Rollout", proTip: "To avoid discomfort in your knees, try to avoid kneeling.", howTo: "Position yourself on your knees with your feet lifted.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-LOWER_transparent.png", equipment: "Ab Wheel", videoURL: "https://app.fitnessai.com/exercises/23321201-Wheel-Rollout-female-Waist.mp4"))
}
