//
//  MealRecordViewModel.swift
//  PTBuddy
//
//  Created by Ji Hye PARK on 6/12/24.
//

import Foundation
import SwiftData

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
            if mealRecords.isEmpty {
                insertInitialData()
            }
        } catch {
            print("Failed to fetch meal records: \(error.localizedDescription)")
        }
    }

    func insertInitialData() {
        guard let context = context else { return }
        let initialData = [
            MealRecord(type: "아침", notes: "기본 아침 메모"),
            MealRecord(type: "점심", notes: "기본 점심 메모"),
            MealRecord(type: "저녁", notes: "기본 저녁 메모"),
            MealRecord(type: "간식", notes: "기본 간식 메모")
        ]

        for record in initialData {
            context.insert(record)
        }

        do {
            try context.save()
            loadMealRecords()
        } catch {
            print("Failed to save initial data: \(error.localizedDescription)")
        }
    }
}

