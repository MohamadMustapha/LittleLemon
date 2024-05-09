//
//  PixelFont.swift
//  Pixel
//
//  Created by Khaled Chehabeddine on 24/01/2024.
//  Copyright © 2024 Pixel. All rights reserved.
//

import SwiftUI

public struct PixelFont {

    public static let superDino1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 36)
    public static let superDino2: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 28)

    public static let dino1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 26)
    public static let dino2: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 24)
    public static let dino3: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 22)
    public static let dino4: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 20)
    public static let dino5: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 20)

    public static let big1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 18)
    public static let big2: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 16)
    public static let big3: PixelFont = .init(isCaps: false, name: DINPro.medium.name, size: 16)
    public static let big4: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 16)

    public static let medium1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 14)
    public static let medium2: PixelFont = .init(isCaps: false, name: DINPro.medium.name, size: 14)
    public static let medium3: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 14)

    public static let mediumSmall1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 13)
    public static let mediumSmall2: PixelFont = .init(isCaps: false, name: DINPro.medium.name, size: 13)
    public static let mediumSmall3: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 13)

    public static let small1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 12)
    public static let small2: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 12)
    public static let small3: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 11)
    public static let small4: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 11)

    public static let superSmall1: PixelFont = .init(isCaps: false, name: DINPro.bold.name, size: 10)
    public static let superSmall2: PixelFont = .init(isCaps: false, name: DINPro.medium.name, size: 10)
    public static let superSmall3: PixelFont = .init(isCaps: false, name: DINPro.regular.name, size: 10)

    public static let capsBig: PixelFont = .init(isCaps: true, name: DINPro.bold.name, size: 10)
    public static let capsMedium: PixelFont = .init(isCaps: true, name: DINPro.medium.name, size: 10)
    public static let capsSmall: PixelFont = .init(isCaps: true, name: DINPro.regular.name, size: 10)
    public static let capsSuperSmall: PixelFont = .init(isCaps: true, name: DINPro.bold.name, size: 10)
    public static let capsSuperTiny: PixelFont = .init(isCaps: true, name: DINPro.medium.name, size: 10)

    static let letterSpacing: CGFloat = 0.2

    let isCaps: Bool

    private let name: String
    private let size: CGFloat

    public var font: Font { .custom(name, size: size) }
}
