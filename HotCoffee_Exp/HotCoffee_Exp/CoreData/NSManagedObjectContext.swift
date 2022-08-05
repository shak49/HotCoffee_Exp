//
//  NSManagedObjectContext.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import UIKit
import CoreData


extension NSManagedObjectContext {
    // MARK:    Properties
    static var current: NSManagedObjectContext {
        let container = PersistenceController.shared.container
        return container.viewContext
    }
}
