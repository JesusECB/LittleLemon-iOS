//
//  RootView.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//


import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        if appState.isLoggedIn {
            HomeView()
                .environmentObject(HomeViewModel())
        } else {
            OnboardingRegistrationView()
        }
    }
}
