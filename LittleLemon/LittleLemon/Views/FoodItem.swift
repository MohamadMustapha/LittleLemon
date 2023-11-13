//
//  FoodItem.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 13/11/2023.
//

import SwiftUI

struct FoodItem: View {
    @State var dish: Dish
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Text(dish.title!)
                    .font(.title2)
                    .bold()
                Text(dish.desc!)
                    .font(.callout)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                Text("$\(dish.price!)")
                    .fontWeight(.medium)
            }
            Spacer()
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(maxWidth: 90, maxHeight: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}
struct FoodItem_Previews: PreviewProvider {
    static var previews: some View {
        FoodItem(dish: PersistenceController.oneDish())
    }
    
}
