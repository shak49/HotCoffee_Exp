//
//  CoreDataManager.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import UIKit
import CoreData


class CoreDataManager {
    // MARK:    Properties
    static let shared = CoreDataManager(objectContext: NSManagedObjectContext.current)
    var objectContext: NSManagedObjectContext
    
    // MARK:    Lifecycles
    private init(objectContext: NSManagedObjectContext) {
        self.objectContext = objectContext
    }
    
    // MARK:    Functions
    func save(name: String, type: String) {
        let order = Order(context: self.objectContext)
        order.name = name
        order.type = type
        print(order)
        do {
            try self.objectContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    func read() -> [Order] {
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        do {
            orders = try self.objectContext.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        return orders
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
}
