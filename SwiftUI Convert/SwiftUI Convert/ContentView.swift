//
//  ContentView.swift
//  SwiftUI Convert
//
//  Created by Stefan Storm on 2024/12/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unit = "Length"
    @State private var inputAmount: Double = 1.0
    @State private var unitPickerA = "Meter"
    @State private var unitPickerB = "Meter"
    @FocusState private var isFocused: Bool
    
    let unitTypes = UnitTypes()
    let dataModel = DataModel()
    
    
    var unitToUse: [String]{
        
        switch unit {
        case "Length":
            return Array(unitTypes.lengthTypes.keys)
            
        case "Mass":

            return Array(unitTypes.massTypes.keys)
        case "Temperature":

            return Array(unitTypes.temperatureTypes.keys)
        default:

            return Array(unitTypes.lengthTypes.keys)
        }
        
    }
    
    var convertedValue: Double {
        print(inputAmount, unitPickerA, unitPickerB)
        
        return dataModel.convertMassAndLength(inputAmount: inputAmount, unit: unit, unitPickerA: unitPickerA, unitPickerB: unitPickerB)
        
    }
  
    var body: some View {
        NavigationStack{

            Form{
                Section("Choose unit type:"){
                    
                    Picker("Unit Type:", selection: $unit) {
                        ForEach(unitTypes.unitTypePicker, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                    .keyboardType(.numberPad)
                    
                    .onChange(of: unit) { _ in
                        inputAmount = 1.0
                        if let firstUnit = unitToUse.first {
                            unitPickerA = firstUnit
                            unitPickerB = firstUnit
                            
                        }
                    }
                    
                }
                
                Section("Convert"){
                    HStack(spacing: 20) {

                        TextField("Input", value: $inputAmount, format: .number)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                        
                        Text("=")
 
                        Text(convertedValue, format: .number)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 2.0)))
                        
                        
                    }
                    
                    HStack(spacing: 40) {
                        
                        Picker("", selection: $unitPickerA) {
                            ForEach(unitToUse, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.automatic)
                        
                        Picker("", selection: $unitPickerB) {
                            ForEach(unitToUse, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.automatic)
                        
                        
                    }

                }
                
            }
            .navigationTitle("Convert")
            .navigationBarTitleDisplayMode(.large)
        }
    }

}





#Preview {
    ContentView()
}
