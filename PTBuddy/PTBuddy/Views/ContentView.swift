//
//  ContentView.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Hello, System Font!")
                .font(.system(size: 28))
                .padding()

            Text("Hello, Pretendard Black!")
                .font(.custom("Pretendard-Black", size: 22))
                .tracking(-0.6)
                .padding()
            
            Text("Hello, Pretendard Light!")
                .font(.custom("Pretendard-Light", size: 24))
                .kerning(-0.4)
                .padding()
        }
        .padding()
        
        .onAppear {
            
        }
    }
}

#Preview {
    ContentView()
}
