//
//  DishResponse.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Foundation

public struct Menu: Decodable {

    public let menu: [DishResponse]
}

public struct DishResponse: Decodable, Identifiable {

    public let id: Int

    public let title: String
    public let description: String
    public let price: String
    public let image: String
    public let category: String
}
