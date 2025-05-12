//
//  RemoteMenuItem.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//
import Foundation

// Coincide con cada objeto del array "menu"
struct RemoteMenuItem: Codable {
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}

// Coincide con el objeto raíz del JSON
struct MenuResponse: Codable {
    let menu: [RemoteMenuItem]
}

// Servicio que trae y transforma los datos
enum MenuService {

    static func fetchMenu() async throws -> [RemoteMenuItem] {
        let urlString = "https://raw.githubusercontent.com/JesusECB/Working-With-Data-API/main/menu.json"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(MenuResponse.self, from: data)
        return decoded.menu
    }

    static func load() async throws -> [MenuItem] {
        let remoteItems = try await fetchMenu()
        return remoteItems.map { remote in
            MenuItem(
                name: remote.title,
                description: remote.description,
                price: remote.price,
                imageName: remote.image,
                category: MenuCategory(from: remote.category)
            )
        }
    }
}
