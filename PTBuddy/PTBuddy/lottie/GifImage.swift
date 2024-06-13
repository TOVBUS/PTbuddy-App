//
//  GifImage.swift
//  PTBuddy
//
//  Created by 김혜수 on 6/13/24.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)

        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false

        return webView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
//        uiView.reload()
    }
}

#Preview {
    VStack {
        Spacer()
        GifImage("loading").background(Color(.red))
            .frame(width: 120, height: 120, alignment: .center)
        Spacer()
    }
}
