//
//  MenuItem.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//
import Foundation

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: String
    let imageName: String
    let category: MenuCategory
}

enum MenuCategory: String, CaseIterable, Identifiable, Codable {
    case starters
    case mains
    case desserts
    case drinks

    var id: String { rawValue }

    init(from raw: String) {
        switch raw.lowercased() {
        case "starters": self = .starters
        case "mains": self = .mains
        case "desserts": self = .desserts
        case "drinks": self = .drinks
        default: self = .mains
        }
    }
}

