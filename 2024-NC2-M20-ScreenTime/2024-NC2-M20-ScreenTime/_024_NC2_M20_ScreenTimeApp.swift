//
//  _024_NC2_M20_ScreenTimeApp.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/17/24.
//

import SwiftUI
import FamilyControls

@main
struct _024_NC2_M20_ScreenTimeApp: App {
    @StateObject var managedSettingModel = ManagedSettingModel.shared
    @StateObject var cycleCountModel = CycleCountModel()
    let center = AuthorizationCenter.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(managedSettingModel)
                .environmentObject(cycleCountModel)
                .onAppear {
                    Task {
                        do {
                            try await center.requestAuthorization(for: .individual)
                        } catch {
                            print("Fail: \(error)")
                        }
                    }
                }
            
        }
    }
}
