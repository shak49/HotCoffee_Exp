//
//  OrderListViewModel.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import CoreData
import Combine


class OrderViewModel {
    var name = ""
    var type = ""
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}

class OrderListViewModel: ObservableObject {
    // MARK:    Properties
    @Published var orders = [OrderViewModel]()
    
    // MARK:    Lifecylces
    init() {
        readOrders()
    }
    
    // MARK:    Functions
    func readOrders() {
        self.orders = CoreDataManager.shared.read().map(OrderViewModel.init)
        print(orders)
    }
}
