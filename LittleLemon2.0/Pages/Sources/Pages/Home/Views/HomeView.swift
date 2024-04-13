//
//  HomeView.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Shared
import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel: HomeViewModel = .init()

    var body: some View {
        NavigationStack {
            switch viewModel.uiState {
            case .loading:
                ProgressView()
                    .controlSize(.large)

            case .loaded(let dishes):
                ForEach(dishes) { dish in
                    VStack{
                        Text(dish.title)
                        Text(dish.price)
                    }
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
