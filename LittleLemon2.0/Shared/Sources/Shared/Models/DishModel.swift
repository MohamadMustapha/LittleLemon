//
//  DishModel.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Foundation

public struct DishModel: Codable, Identifiable {

    public let id: Int

    public let title: String
    public let description: String
    public let price: String
    public let image: String
    public let category: String

    public init(id: Int, title: String, description: String, price: String, image: String, category: String) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.image = image
        self.category = category
    }
}
