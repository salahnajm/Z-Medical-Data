//
//  ZeusMedicApp.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

@main
struct MedicApp: App {

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ZeusModel())
                .environmentObject(DiagnosisModel())
            
        }
    }
}
