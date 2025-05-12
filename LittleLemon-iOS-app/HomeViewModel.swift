//
//  HomeViewModel.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//


import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var menu: [MenuItem] = []
    @Published var searchText: String = ""
    @Published var selectedCategory: MenuCategory? = nil

    var filteredMenu: [MenuItem] {
        menu.filter {
            (selectedCategory == nil || $0.category == selectedCategory) &&
            (searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText))
        }
    }

    init() {
        Task {
            await loadMenu()
        }
    }

    @MainActor
    func loadMenu() async {
        do {
            self.menu = try await MenuService.load()
            print("✅ Menu loaded: \(menu.count) items.")
        } catch {
            print("❌ Error loading menu: \(error.localizedDescription)")
        }
    }
}
