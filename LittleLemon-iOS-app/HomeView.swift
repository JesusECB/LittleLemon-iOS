//
//  HomeViewModel.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//
import SwiftUI
import SwiftData

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Query private var users: [User]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // LOGO al tope
                HStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    Spacer()
                }
                .padding(.top, 8)

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {

                        // Hero Header
                        HeroHeader()
                            .padding(.horizontal)

                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.secondary)
                            TextField("Enter search phrase", text: $viewModel.searchText)
                                .textInputAutocapitalization(.never)
                        }
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.llGreenDark.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.horizontal)

                        // Title and delivery icon
                        HStack {
                            Text("Order for Delivery!")
                                .font(.title2.bold())
                                .foregroundColor(.llGrayDark)
                            Spacer()
                            Image(systemName: "car.fill")
                                .font(.title2)
                                .foregroundColor(.llGreenDark)
                        }
                        .padding(.horizontal)

                        // Category picker
                        CategoryPicker(selectedCategory: $viewModel.selectedCategory)
                            .padding(.horizontal)

                        // Menu list
                        VStack(spacing: 0) {
                            ForEach(viewModel.filteredMenu) { item in
                                MenuRow(item: item)
                                Divider()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top)
                }
            }

            // Toolbar with profile image
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
        .environmentObject(AppState())

}
