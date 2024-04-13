//
//  ErrorView.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import SwiftUI

public struct ErrorView: View {

    private let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .frame(width: 100, height: 100)

            Text("An error occurred")
                .font(.title)
                .fontWeight(.bold)

            Button {
                action()
            } label: {
                Text("Retry")
                    .font(.title3)
                    .foregroundStyle(.black)
                    .frame(width: 200)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(.gray.opacity(0.2))
                    )
            }
        }
    }
}

#Preview {

    ErrorView { }
}
