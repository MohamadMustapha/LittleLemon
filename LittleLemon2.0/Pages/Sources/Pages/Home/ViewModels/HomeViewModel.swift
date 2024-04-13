//
//  HomeViewModel.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Network
import Shared
import SwiftUI

class HomeViewModel: ObservableObject {

    enum UIState {

        case loading, loaded(dishes: [DishModel]), error
    }

    @Published private(set) var uiState: UIState = .loading

    private let homeService: HomeService = HomeServiceImpl(dishesApi: HTTPDishesApi())

    public init() { }

    func loadDishes() async {
        do {
            let dishes: [DishModel] = try await homeService.getDishes().get()
            withAnimation {
                uiState = .loaded(dishes: dishes)
            }
        } catch {
            print("error \(error.localizedDescription)")
            uiState = .error
        }
    }
}
