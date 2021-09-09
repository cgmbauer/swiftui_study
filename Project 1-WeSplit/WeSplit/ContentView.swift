//
//  ContentView.swift
//  WeSplit
//
//  Created by user204209 on 8/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var total: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let grandTotal = orderAmount + orderAmount * tipSelection / 100	
        return grandTotal
    }
    	
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.numberPad)
                }
                
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(total, specifier: "%.2f")")
                }
                
                Section(header: Text("Total amount")) {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
