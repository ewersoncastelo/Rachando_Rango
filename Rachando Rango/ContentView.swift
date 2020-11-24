//
//  ContentView.swift
//  Rachando Rango
//
//  Created by ewerson castelo on 22/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let studentys = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Enter with your name", text: $name)
                    Text("Hello, \(name) how are you?")
                    Button("Tap Count: \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                
                Section {
                    Text("Please, shoose your studenty")
                        .foregroundColor(.orange)
                    Picker("Select your studenty", selection: $selectedStudent){
                        ForEach(0 ..< studentys.count){
                            Text("\(self.studentys[$0])")
                        }
                    }
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
