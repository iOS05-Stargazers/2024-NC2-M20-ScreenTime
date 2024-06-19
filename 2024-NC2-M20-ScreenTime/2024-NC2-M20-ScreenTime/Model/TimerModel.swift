//
//  TimerModel.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/19/24.
//

import Foundation

class TimerModel: ObservableObject{
    @Published var count: Int = 1
    @Published var finishedText: String? = nil
    @Published var focusTimeRemaining = "25:00"
    @Published var restTimeRemaining = "05:00"
    @Published var isfinishedSecond = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let focusTime: Date = Calendar.current.date(byAdding: .second, value: 3, to: Date()) ?? Date()
    let restTime: Date = Calendar.current.date(byAdding: .second, value: 3, to: Date()) ?? Date()

    func updateFocusTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: focusTime)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        focusTimeRemaining = String(format: "%02d:%02d", minute, second)
        isfinishedSecond = second
    }
    
    func updateRestTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: restTime)
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        restTimeRemaining = String(format: "%02d:%02d", minute, second)
        isfinishedSecond = second
    }
    
    
    func stopTimer() {
        timer.upstream.connect().cancel()
        isfinishedSecond = 0
    }

}
