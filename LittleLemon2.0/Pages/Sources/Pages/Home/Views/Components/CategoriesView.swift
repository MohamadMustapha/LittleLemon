//
//  CategoriesView.swift
//
//
//  Created by Mohamad Mustapha on 14/04/2024.
//

import Shared
import SwiftUI

public struct CategoriesView: View {

    private let categories: [String] = ["Starters",
                                        "Mains",
                                        "Sides",
                                        "Desserts",
                                        "Drinks"]

    @Binding var selectedItem: String?

    public var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(PixelFont.dino4.font)
                .tracking(0.2)
                .foregroundStyle(PixelColor.blue)
                .padding(.horizontal)

            ScrollView(.horizontal) {
                HStack(spacing: .p5) {
                    ForEach(Array(categories.enumerated()), id: \.element) { category in
                        Button {
                            if let selected = selectedItem, selected == category.element {
                                selectedItem = nil
                            } else {
                                selectedItem = category.element
                            }

                        } label: {
                            Text(category.element)
                                .font(PixelFont.medium3.font)
                                .tracking(0.2)
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                                .padding(.horizontal, .p10)
                                .padding(.vertical, .p4)
                                .foregroundStyle(category.element == selectedItem ? PixelColor.cottonCandy : PixelColor.dark1)
                                .background(
                                Capsule()
                                    .fill(category.element == selectedItem ? PixelColor.barleyWhite : PixelColor.light3
                                        )
                                )
                                .animation(.easeOut, value: selectedItem)
                        }
                        .buttonStyle(.plain)
                    }

                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {

    CategoriesView(selectedItem: .constant("Sides"))
}
