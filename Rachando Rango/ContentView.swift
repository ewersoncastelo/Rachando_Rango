//
//  ContentView.swift
//  Rachando Rango
//
//  Created by ewerson castelo on 22/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCost = ""
    @State private var numberOfPeople = 2
    @State private var percentageTip = 2
    
    let percentagesTips = [5, 10, 15, 20, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Total Cost", text: $totalCost)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Text("The cost total is \(totalCost)")
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
