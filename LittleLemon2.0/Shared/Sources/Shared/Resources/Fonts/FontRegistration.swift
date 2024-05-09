//
//  FontRegistration.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import CoreGraphics
import CoreText
import UIKit

enum FontError: Error {

    case failedFontRegistration
}

func registerFont(named name: String) throws {
    guard let asset: NSDataAsset = .init(name: .dinProFolder + name, bundle: .module),
          let provider: CGDataProvider = .init(data: asset.data as NSData),
          let font: CGFont = .init(provider),
          CTFontManagerRegisterGraphicsFont(font, nil) else { throw FontError.failedFontRegistration }
}

fileprivate extension String {

    static let dinProFolder = "DIN Pro/"
}
