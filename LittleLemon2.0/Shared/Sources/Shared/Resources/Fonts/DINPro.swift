//
//  DINPro.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import Foundation

public struct DINPro {

    public static let light: DINPro = .init(name: "DINPro-Light")
    public static let regular: DINPro = .init(name: "DINPro")
    public static let medium: DINPro = .init(name: "DINPro-Medium")
    public static let bold: DINPro = .init(name: "DINPro-Bold")
    public static let black: DINPro = .init(name: "DINPro-Black")

    public let name: String

    private init(name: String) {
        self.name = name
        do {
            try registerFont(named: name)
        } catch {
            let reason: String = error.localizedDescription
            fatalError("Failed to register font \(name) with reason: \(reason)")
        }
    }
}
