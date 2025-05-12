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
    var body: some Scene {
        WindowGroup {
            OnboardingRegistrationView()
        }
        .modelContainer(for: User.self)
    }
}

