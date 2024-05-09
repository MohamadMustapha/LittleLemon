//
//  HeroView.swift
//
//
//  Created by Mohamad Mustapha on 14/04/2024.
//

import Shared
import SwiftUI

struct HeroView: View {

    var body: some View {
        HStack(alignment: .top, spacing: .p10) {
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .font(PixelFont.dino1.font)
                    .tracking(0.2)
                    .lineLimit(1)
                    .foregroundStyle(PixelColor.barleyWhite)
                Text("Chicago")
                    .font(PixelFont.dino4.font)
                    .tracking(0.2)
                    .lineLimit(1)
                    .foregroundStyle(PixelColor.blue)
                Text("A family owned mediterranean restaurant serving traditional recipes with a modern twist")
                    .font(PixelFont.medium3.font)
                    .tracking(0.2)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(PixelColor.dark1)
                    .padding(.top)
            }
            Image("Hero", bundle: .module)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: .dino))
                .frame(width: 130, height: 130)
        }
        .padding(.p5)
        .background(PixelColor.cosmos)
        .clipShape(RoundedRectangle(cornerRadius: .p13))
    }

}

#Preview {

    HeroView()
}
