//
//  DataModel.swift
//  SwiftUI Convert
//
//  Created by Stefan Storm on 2024/12/12.
//

import Foundation

class DataModel {
    
    func convertTemperature(value: Double, from: String, to: String) -> Double {
        switch (from, to) {
        case ("Celsius", "Fahrenheit"):
            return value * 9 / 5 + 32
        case ("Fahrenheit", "Celsius"):
            return (value - 32) * 5 / 9
        case ("Celsius", "Kelvin"):
            return value + 273.15
        case ("Kelvin", "Celsius"):
            return value - 273.15
        case ("Fahrenheit", "Kelvin"):
            return (value - 32) * 5 / 9 + 273.15
        case ("Kelvin", "Fahrenheit"):
            return (value - 273.15) * 9 / 5 + 32
        default:
            return value
        }
    }
    
    func convertMassAndLength(inputAmount: Double,unit: String, unitPickerA: String, unitPickerB : String) -> Double{
        if unit == "Temperature" {
            return convertTemperature(value: inputAmount, from: unitPickerA, to: unitPickerB)
        } else if unit == "Length" {

            let factorA = UnitTypes().lengthTypes[unitPickerA] ?? 1.0
            let factorB = UnitTypes().lengthTypes[unitPickerB] ?? 1.0
            return inputAmount * (1 / factorA) * factorB
        }else{
            let factorA = UnitTypes().massTypes[unitPickerA] ?? 1.0
            let factorB = UnitTypes().massTypes[unitPickerB] ?? 1.0
            return inputAmount * (1 / factorA) * factorB
        }
    }
    
    
}
