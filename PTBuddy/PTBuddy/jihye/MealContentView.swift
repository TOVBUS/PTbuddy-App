//
//  MealContentView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/3/24.
//

import SwiftUI

struct MealContentView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                RecommendedDietView()
                
                MealRecordsView()
                
                GetDietButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealContentView()
    }
}
