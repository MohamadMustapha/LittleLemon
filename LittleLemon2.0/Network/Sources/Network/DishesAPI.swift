//
//  DishesAPI.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Foundation

protocol DishesAPI: API {

    func getDishes() async throws -> Menu
}

public struct HTTPDishesApi: DishesAPI {

    public init() { }

    public func getDishes() async throws -> Menu {
        return try await decode(url: validateUrl())
    }

    private func decode<T: Decodable>(url: URL) async throws -> T {
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse else { throw APIError.invalidResponse }
        guard 200...299 ~= response.statusCode else { throw APIError.statusCodeNotOk }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
