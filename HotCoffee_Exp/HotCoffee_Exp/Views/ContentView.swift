//
//  ContentView.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: OrderListViewModel
    @State private var isPresented: Bool = false
    
    init() {
        self.model = OrderListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.model.orders, id: \.name) { order in
                    HStack {
                        Image(order.type)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        Text(order.name)
                            .font(.largeTitle)
                            .padding([.leading], 10)
                    }
                }
            }
            .sheet(isPresented: $isPresented, onDismiss: {
                print("ON DISMISS")
                self.model.readOrders()
            }, content: {
                AddOrderView(isPresented: $isPresented)
            })
            .navigationBarItems(trailing: Button("New Order") {
                self.isPresented.toggle()
            })
            .listStyle(.plain)
            .navigationTitle(Text("Orders"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
