//
//  ProfileView.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//


import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appState: AppState


    var body: some View {
        NavigationStack {
            if let user = users.first {
                VStack(spacing: 24) {

                    // Logo centrado arriba
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .padding(.top, 32)

                    // Título de la sección
                    Text("Personal information")
                        .font(.headline)
                        .foregroundColor(.llGrayDark)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    // Campo: First name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("First name")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(user.firstName)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray.opacity(0.4))
                            )
                    }
                    .padding(.horizontal)

                    // Campo: Last name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Last name")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(user.lastName)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray.opacity(0.4))
                            )
                    }
                    .padding(.horizontal)

                    // Campo: Email
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(user.email)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray.opacity(0.4))
                            )
                    }
                    .padding(.horizontal)

                    Spacer()

                    // Botón Logout
                    Button("Logout") {
                        context.delete(user)
                        try? context.save()
                        appState.isLoggedIn = false  // ✅ Esto regresa al onboarding limpio
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.llYellow)
                    .foregroundColor(.black)
                    .cornerRadius(8)
                    .padding(.horizontal)

                    Spacer()
                }
                .background(Color.llWhite)
            } else {
                Text("No user found")
                    .foregroundColor(.secondary)
            }
        }
    }
}
