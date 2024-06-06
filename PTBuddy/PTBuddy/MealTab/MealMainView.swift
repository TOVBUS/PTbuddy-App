//
//  MealMainView.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/5/24.
//

import SwiftUI

struct MealMainView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                RecommendedDietView()
                
                MealRecordsView()
                
                Spacer()
                
                GetDietButton()
            }

        }
    }
}

#Preview {
    MealMainView()
}
