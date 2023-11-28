//
//  Hero.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 25/11/2023.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Little Lemon")
                .foregroundColor(Color.primaryColor2)
                .font(.system(size: 42))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Chicago")
                .foregroundColor(Color.highlightColor1)
                .font(.title2)
            HStack{
                VStack{
                    Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .foregroundColor(Color.highlightColor1)
                        .font(.callout)
                }
                Image("Hero")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 120, height: 120)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Hero()
}
