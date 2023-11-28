//
//  Header.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 26/11/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Image("Logo")
            Image("profile-image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 70)
        }
    }
}

#Preview {
    Header()
}
