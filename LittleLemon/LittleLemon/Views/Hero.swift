//
//  Hero.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 25/11/2023.
//

import SwiftUI

struct Hero: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Little Lemon")
                .foregroundColor(Color.primaryColor2)
                .font(.system(size: 48))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Chicago")
                .foregroundColor(Color.highlightColor1)
                .font(.title)
            HStack{
                VStack(){
                    Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .foregroundColor(Color.highlightColor1)
                }
                Image("Hero")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 150)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
        .padding()
    }
}

#Preview {
    Hero()
}
