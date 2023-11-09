//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 09/11/2023.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
