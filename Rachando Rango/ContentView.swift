//
//  ContentView.swift
//  Rachando Rango
//
//  Created by ewerson castelo on 22/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCost = ""
    @State private var numberOfPeople = ""
    @State private var percentageTip = 4
    
    let percentagesTip = [5, 10, 15, 20, 0]
    
    private func totalAmountAndTip() -> Double {
        let tipSelection = Double(percentagesTip[percentageTip])
        let orderAmount = Double(totalCost) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let numberPeople = Int(numberOfPeople) ?? 0
        let peopleCount = Double(numberPeople + 2)
        let grandTotal = totalAmountAndTip()
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Amount Value and Number of People")) {
                    TextField("Total Cost", text: $totalCost)
                        .keyboardType(.decimalPad)
                    TextField("Select the number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want?")){
                    Picker("Percentagem Tip", selection: $percentageTip){
                        ForEach(0..<percentagesTip.count){
                            Text("\(self.percentagesTip[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount Total")){
                    Text("The amount total is: R$ \(totalAmountAndTip(), specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
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
