//
//  HomeView.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Shared
import SwiftUI

public struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel = .init()

    @State private var selectedItem: String?

    public init() { }

    public var body: some View {
        NavigationStack {
            switch viewModel.uiState {
            case .loading:
                ProgressView()
                    .controlSize(.large)

            case .loaded(let dishes):
                VStack {
                    Image("Logo", bundle: .module)
                    ScrollView {
                        VStack(spacing: .p10) {
                            HeroView()
                                .padding(.horizontal, .p4)

                            CategoriesView(selectedItem: $selectedItem)

                            ForEach(dishes) { dish in
                                DishCardView(dish: dish)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .scrollIndicators(.never)
                }
            case .error :
                ErrorView {
                    Task {
                        await viewModel.loadDishes()
                    }
                }
            }
        }
        .task {
            await viewModel.loadDishes()
        }
    }
}

#Preview {

    HomeView()
}
