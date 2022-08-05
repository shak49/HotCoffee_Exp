//
//  AddOrderViewModel.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import SwiftUI


class AddOrderViewModel {
    // MARK:    Properties
    var name: String = ""
    var type: String = ""
    
    // MARK:    Functions
    func createOrder() {
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
    }
    
    
}
