//
//  CategoryPicker.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//


import SwiftUI

struct CategoryPicker: View {
    @Binding var selectedCategory: MenuCategory?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(MenuCategory.allCases) { category in
                    Button {
                        selectedCategory = (selectedCategory == category ? nil : category)
                    } label: {
                        Text(category.rawValue)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .fill(selectedCategory == category ? Color.llYellow: Color(.systemGray6))
                            )
                            .foregroundColor(selectedCategory == category ? .black : .primary)
                    }
                }
            }
        }
    }
}
