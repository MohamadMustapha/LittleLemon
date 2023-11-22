//
//  Styles.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 22/11/2023.
//

import SwiftUI

extension Color {
    init(hex: String) {
        var formatted = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if formatted.hasPrefix("#") {
            formatted.remove(at: formatted.startIndex)
        }
        
        guard formatted.count == 6 else {
            self.init(.white)
            return
        }
        
        var rgb: UInt64 = 0
        Scanner(string: formatted).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    static let primaryColor1 = Color(hex: "495E57")
    static let primaryColor2 = Color(hex: "F4CE14")

    static let secondaryColor1 = Color(hex: "EE9972")
    static let secondaryColor2 = Color(hex: "FBDABB")

    static let highlightColor1 = Color(hex: "EDEFEE")
    static let highlightColor2 = Color(hex: "333333")
}

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.primaryColor1)
            .font(.custom("Karla-Bold", size: 13))
    }
}
struct ButtonStyleYellowColorWide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.vertical)
    }
}

struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryColor1)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
    }
}
