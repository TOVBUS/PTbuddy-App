//
//  MealRecordViewModel.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/12/24.
//

import SwiftData
import SwiftUI

class MealRecordViewModel: ObservableObject {
    @Published var mealRecords: [MealRecord] = []
    private var context: ModelContext?

    func setContext(_ context: ModelContext) {
        self.context = context
        loadMealRecords()
    }

    func loadMealRecords() {
        guard let context = context else { return }
        let fetchDescriptor = FetchDescriptor<MealRecord>()
        do {
            mealRecords = try context.fetch(fetchDescriptor)
        } catch {
            print("Failed to fetch meal records: \(error.localizedDescription)")
        }
    }

    func addMealRecord(type: String, notes: String = "", images: [Data] = []) {
        guard let context = context else { return }
        let newMealRecord = MealRecord(type: type, notes: notes, images: images)
        context.insert(newMealRecord)

        do {
            try context.save()
            loadMealRecords() // 새로운 기록을 추가한 후 다시 로드하여 업데이트
        } catch {
            print("Failed to save meal record: \(error.localizedDescription)")
        }
    }
}
