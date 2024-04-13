//
//  HomeService.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Foundation
import Network
import Shared

public protocol HomeService {

    func getDishes() async -> Result<[DishModel], Error>
}

public struct HomeServiceImpl: HomeService {

    let dishesApi: HTTPDishesApi

    public func getDishes() async -> Result<[Shared.DishModel], Error> {
        do {
            let response: Menu = try await dishesApi.getDishes()
            let dishes: [DishModel] = try dishesParser(from: response)

            return .success(dishes)
        } catch {
            return .failure(error)
        }
    }

    private func dishesParser(from menu: Menu) throws -> [DishModel] {
        return menu.menu.map {.init(id: $0.id,
                                    title: $0.title,
                                    description: $0.description,
                                    price: $0.price,
                                    image: $0.image,
                                    category: $0.category)}
    }
}
