//
//  MenuRow.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//
import SwiftUI

struct MenuRow: View {
    let item: MenuItem

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                Text(item.price)
                    .font(.subheadline.bold())
                    .foregroundColor(.primary)
                    .padding(.top, 4)
            }

            Spacer()

            // Imagen inteligente: remota o local
            Group {
                if item.imageName.starts(with: "http") {
                    AsyncImage(url: URL(string: item.imageName)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(item.imageName)
                        .resizable()
                }
            }
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.vertical, 12)
    }
}
