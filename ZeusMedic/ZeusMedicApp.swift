//
//  ZeusMedicApp.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/9/22.
//

import SwiftUI

@main
struct ZeusMedicApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ZeusModel())
            
        }
    }
}
