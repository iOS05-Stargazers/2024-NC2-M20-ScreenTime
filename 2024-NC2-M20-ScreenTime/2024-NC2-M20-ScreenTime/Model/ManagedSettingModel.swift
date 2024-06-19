//
//  ManagedSettingModel.swift
//  2024-NC2-M20-ScreenTime
//
//  Created by TEO on 6/18/24.
//
import Foundation
import FamilyControls
import ManagedSettings // WWDC에서 직접적인 사용 제한을 걸기 위한 프레임워크라고 소개했는데 그 말대로네요.


class ManagedSettingModel: ObservableObject {
    
    static var shared = ManagedSettingModel()
    
    let store = ManagedSettingsStore()
    
    @Published var selectionToDiscourage: FamilyActivitySelection
    
    init() {
        selectionToDiscourage = FamilyActivitySelection()
    }
    
    func setShieldRestrictions() {
        let applications = ManagedSettingModel.shared.selectionToDiscourage
        
        store.shield.applications = applications.applicationTokens.isEmpty ? nil : applications.applicationTokens
        store.shield.applicationCategories = applications.categoryTokens.isEmpty ? nil : ShieldSettings.ActivityCategoryPolicy.specific(applications.categoryTokens)
    }
    
    func freeShieldRestrictions() {
        store.shield.applications = nil
        store.shield.applicationCategories =  nil
    }
    
    func isSelectionEmpty() -> Bool {
        selectionToDiscourage.applicationTokens.isEmpty &&
        selectionToDiscourage.categoryTokens.isEmpty &&
        selectionToDiscourage.webDomainTokens.isEmpty
    }
    
}
