//
//  VideoView.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/13/24.
//

import SwiftUI
import AVFoundation

struct VideoPlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: Context) { }

    let url: URL

    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, url: url)
    }
}

class PlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var player: AVPlayer?

    init(frame: CGRect, url: URL) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.player = AVPlayer(url: url)
        self.playerLayer.player = player
        self.playerLayer.videoGravity = .resizeAspect
        self.layer.addSublayer(playerLayer)
        player?.play()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = self.bounds
    }
}

struct VideoView: View {
    var body: some View {
        VStack {
            Spacer()
            VideoPlayerView(url: URL(string: "https://app.fitnessai.com/exercises/34991201-Self-Assisted-Inverted-Pullover-Back.mp4")!)
                .frame(height: 300)
            Spacer()
        }
    }
}

#Preview {
    VideoView()
}

