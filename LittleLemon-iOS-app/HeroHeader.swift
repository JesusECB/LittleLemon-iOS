//
//  HeroHeader.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//
import SwiftUI

struct HeroHeader: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.llGreenDark

            VStack(alignment: .leading, spacing: 8) {
                Spacer().frame(height: 8)

                Text("Little Lemon")
                    .font(.largeTitle.bold())
                    .foregroundColor(.llYellow)

                Text("Chicago")
                    .font(.title3.bold())
                    .foregroundColor(.white)

                Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.trailing, 120)
            }
            .padding()

            Image("hero_food")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 100)
                .offset(x: 230, y: 80)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(minHeight: 220)
    }
}
