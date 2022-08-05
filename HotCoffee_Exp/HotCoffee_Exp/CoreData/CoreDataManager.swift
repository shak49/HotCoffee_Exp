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
    func saveOrder(name: String, type: String) {
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
    
    func readOrders() -> [Order] {
        var orders = [Order]()
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        do {
            orders = try self.objectContext.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        return orders
    }
    
    func updateOrder() {
        
    }
    
    func deleteOrder(name: String) {
        do {
            if let order = readOrder(name: name) {
                self.objectContext.delete(order)
                try self.objectContext.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    private func readOrder(name: String) -> Order? {
        var orders = [Order]()
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", name)
        do {
            orders = try self.objectContext.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        return orders.first
    }
}
