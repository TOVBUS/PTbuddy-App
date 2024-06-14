//
//  ActivityViewModel.swift
//  PTBuddy
//
//  Created by doyeonjeong on 6/7/24.
//

import SwiftUI
import Combine
import Alamofire

class ActivityViewModel: ObservableObject {
    @Published var activities: [Activity] = [
        Activity(id: "ab-wheel-rollout", activityTitle: "앱 휠 롤아웃", proTip: "무릎의 불편함을 피하려면 무릎을 꿇지 않도록 하세요.", howTo: "무릎을 꿇고 발을 들어 올린 상태에서 시작하세요.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-LOWER_transparent.png", equipment: "Ab Wheel", videoURL: "https://app.fitnessai.com/exercises/23321201-Wheel-Rollout-female-Waist.mp4"),
        Activity(id: "air-bike", activityTitle: "에어 바이크", proTip: "팔로 머리를 당기지 마세요.", howTo: "머리 뒤에 손을 놓고 바닥에 평평하게 누워세요.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Obliques_transparent.png", equipment: "Air Bike", videoURL: "https://app.fitnessai.com/exercises/00031201-air-bike-m-waist.mp4"),
        Activity(id: "alternating-straight-leg-raise", activityTitle: "알터네이팅 스트레이트 레그 레이즈", proTip: "다리를 올릴 때 더 강하게 숨을 내쉬세요.", howTo: "다리를 똑바로 펴고 천장을 향해 누워세요.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-LOWER_transparent.png", equipment: "None", videoURL: "https://app.fitnessai.com/exercises/34961201-Lying-Straight-Leg-Marches-Waist.mp4"),
        Activity(id: "assisted-straight-leg-raise", activityTitle: "어시스트 스트레이트 레그 레이즈", proTip: "집에서 운동하거나 벤치가 없을 때 이 운동을 하세요.", howTo: "천장을 향해 누워 벤치 옆에 위치하세요.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-LOWER_transparent.png", equipment: "Bench", videoURL: "https://app.fitnessai.com/exercises/34991201-Self-Assisted-Inverted-Pullover-Back.mp4"),
        Activity(id: "band-air-bike", activityTitle: "밴드 에어 바이크", proTip: "이 운동의 난이도를 높이려면 다리를 똑바로 유지하세요.", howTo: "밴드를 파워 랙이나 기둥에 단단히 감으세요.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-LOWER_transparent.png", equipment: "Band", videoURL: "https://app.fitnessai.com/exercises/09721201-band-bicycle-crunch-waist.mp4"),
        Activity(id: "band-crunch", activityTitle: "밴드 크런치", proTip: "불편함을 느끼면 허리 아래에 매트나 수건을 놓으세요.", howTo: "팔을 완전히 펴고 밴드를 잡고 바닥에 누워세요.", primaryMusc: "Abs", muscleImage: "https://app.fitnessai.com/musclegroups/full/08751101-Rectus-Abdominis-UPPER_transparent.png", equipment: "Band", videoURL: "https://app.fitnessai.com/exercises/40831201-band-upper-crunch-male-waist.mp4")
    ]
    
    @Published var routines: [WeeklyRoutine] = [
        WeeklyRoutine(id: UUID().uuidString, day: "월요일", exerciseArea: "전신 유산소", exerciseNameEN: "Treadmill Running", exerciseNameKR: "트레드밀 달리기", reps: nil, sets: nil, weight: nil, duration: "3600"),
        WeeklyRoutine(id: UUID().uuidString, day: "화요일", exerciseArea: "하체 근력 훈련 (하체, 복부)", exerciseNameEN: "Squats", exerciseNameKR: "스쿼트", reps: "15회", sets: "3세트", weight: "10kg", duration: nil),
        WeeklyRoutine(id: UUID().uuidString, day: "수요일", exerciseArea: "상체 근력 훈련 (가슴, 어깨, 삼두)", exerciseNameEN: "Push-ups", exerciseNameKR: "푸쉬업", reps: "20회", sets: "3세트", weight: nil, duration: nil),
        WeeklyRoutine(id: UUID().uuidString, day: "목요일", exerciseArea: "전신 유산소", exerciseNameEN: "Running", exerciseNameKR: "달리기", reps: nil, sets: nil, weight: nil, duration: "3600"),
        WeeklyRoutine(id: UUID().uuidString, day: "금요일", exerciseArea: "하체 근력 훈련 (하체, 복부)", exerciseNameEN: "Deadlifts", exerciseNameKR: "데드리프트", reps: "12회", sets: "3세트", weight: "10kg", duration: nil)
    ]
    @Published var weeklyGoal: Int = 7
    @Published var completedWorkouts: Int = 3
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchActivities()
        fetchRoutines()
    }
    
    // TODO: fetch data with alamofire
    func fetchActivities() {
        let url = "http://localhost:3000/today/routine"
    }
    
    // TODO: fetch data with alamofire & parseResponse to weekly routine
    func fetchRoutines() {
        let url = "http://localhost:3000/routine/generate"
    }
    
    private func parseWeeklyRoutineResponse(response: String) -> [WeeklyRoutine] {
        let lines = response.components(separatedBy: "||")
        
        for line in lines {
            let fields = line.components(separatedBy: "|")
            var day = ""
            var exerciseArea = ""
            var exerciseNameEN = ""
            var exerciseNameKR = ""
            var reps: String? = nil
            var sets: String? = nil
            var weight: String? = nil
            var duration: String? = nil
            
            for field in fields {
                let pair = field.components(separatedBy: ":")
                if pair.count == 2 {
                    let key = pair[0]
                    let value = pair[1]
                    
                    switch key {
                        case "요일":
                            day = value
                        case "부위":
                            exerciseArea = value
                        case "이름(영어)":
                            exerciseNameEN = value
                        case "이름(한글)":
                            exerciseNameKR = value
                        case "횟수":
                            reps = value == "null" ? nil : value
                        case "세트":
                            sets = value == "null" ? nil : value
                        case "무게(kg)":
                            weight = value == "null" ? nil : value
                        case "시간(초)":
                            duration = value == "null" ? nil : value
                        default:
                            break
                    }
                }
            }
            
            let routine = WeeklyRoutine(
                id: "String", // TODO: API에서 넘겨주는 id 받기
                day: day,
                exerciseArea: exerciseArea,
                exerciseNameEN: exerciseNameEN,
                exerciseNameKR: exerciseNameKR,
                reps: reps,
                sets: sets,
                weight: weight,
                duration: duration
            )
            routines.append(routine)
        }
        
        return routines
    }
}
