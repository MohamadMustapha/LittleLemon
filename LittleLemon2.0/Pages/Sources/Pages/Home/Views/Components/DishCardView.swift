//
//  DishCardView.swift
//
//
//  Created by Mohamad Mustapha on 14/04/2024.
//

import Kingfisher
import Shared
import SwiftUI

struct DishCardView: View {

    let dish: DishModel

    var body: some View {
        Button {

        } label: {
            VStack(alignment: .leading, spacing: 10) {
                KFImage(.init(string: dish.image))
                    .resizable()
                    .aspectRatio(2.5, contentMode: .fit)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(dish.title)
                            .tracking(0.2)
                            .lineLimit(1)
                        Text(dish.price)
                    }
                    Text(dish.description)
                        .tracking(0.2)
                        .lineLimit(1)
                }
                .padding(.horizontal)
            }
        }
        .background(PixelColor.cosmos.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .buttonStyle(.plain)
    }
}

#Preview {

    DishCardView(dish: .init(id: 1,
                             title: "Pasta",
                             description: "good pasta dish",
                             price: "10",
                             image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/pasta.jpg?raw=true",
                             category: "main"))
}
