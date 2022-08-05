//
//  AddOrderView.swift
//  HotCoffee_Exp
//
//  Created by Shak Feizi on 8/5/22.
//

import SwiftUI

struct AddOrderView: View {
    @State var model = AddOrderViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    TextField("Enter name...", text: $model.name)
                    Picker(selection: $model.type, content: {
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("ex")
                    }, label: {
                        Text("")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    Button("Place Order"){
                        model.createOrder()
                        //self.isPresented = false
                    }
                    .frame(width: 150, height: 50)
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(10)
                    .padding(8)
                }
            }
            .padding()
            .navigationTitle("Add Order")
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
