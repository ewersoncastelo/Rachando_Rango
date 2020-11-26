//
//  ContentView.swift
//  Rachando Rango
//
//  Created by ewerson castelo on 22/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCost = ""
    @State private var numberOfPeople = 0
    @State private var percentageTip = 4
    
    let percentagesTip = [5, 10, 15, 20, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(percentagesTip[percentageTip])
        let orderAmount = Double(totalCost) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total Cost", text: $totalCost)
                        .keyboardType(.decimalPad)
                    Picker("Select the number of people", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0)")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want?")){
                    Picker("Percentagem Tip", selection: $percentageTip){
                        ForEach(0..<percentagesTip.count){
                            Text("\(self.percentagesTip[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("The cost total is \(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("Rachando Rango"), displayMode: .inline)
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
