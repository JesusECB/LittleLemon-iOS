//
//  LittleLemonApp.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//

import Foundation
import SwiftUI
import SwiftData

@main
struct LittleLemonApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .modelContainer(for: User.self)
        }
    }
}




