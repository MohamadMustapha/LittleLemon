//
//  ContentView.swift
//  LittleLemon2.0
//
//  Created by Mohamad Mustapha on 13/04/2024.
//

import Pages
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            Text("profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
