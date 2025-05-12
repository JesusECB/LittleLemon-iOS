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

    var body: some View {
        NavigationStack {
            if let user = users.first {
                VStack(spacing: 24) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)

                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title)
                        .fontWeight(.bold)

                    Text(user.email)
                        .foregroundColor(.secondary)

                    Button("Logout") {
                        context.delete(user)
                        try? context.save()
                        dismiss()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                .padding()
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                Text("No user found")
                    .foregroundColor(.secondary)
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
