//
//  HotCoffee_ExpApp.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import SwiftUI

@main
struct HotCoffee_ExpApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            AddOrderView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
