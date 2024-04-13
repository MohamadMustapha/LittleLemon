//
//  API.swift
//
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Foundation

public enum APIError: Error {

    case invalidURL
    case invalidResponse
    case statusCodeNotOk
}

public protocol API {

    func validateUrl() throws -> URL
}

public extension API {
    
    private var urlString: String { "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json" }

    func validateUrl() throws -> URL {
        guard let url: URL = .init(string: urlString ) else { throw APIError.invalidURL }

        return url
    }
}
