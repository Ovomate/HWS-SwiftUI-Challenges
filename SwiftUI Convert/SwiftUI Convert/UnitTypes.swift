//
//  UnitTypes.swift
//  SwiftUI Convert
//
//  Created by Stefan Storm on 2024/12/12.
//

import Foundation


struct UnitTypes {
    
    var unitTypePicker = ["Length", "Mass", "Temperature"]
    
    
    var lengthTypes: [String: Double] = [
        "Millimeter": 1000,
        "Centimeter": 100,
        "Meter": 1,
        "Kilometer": 0.001,
        "Inch": 39.3701,
        "Foot": 3.28084,
        "Yard": 1.09361,
        "Mile": 0.000621371
    ]
    

    var massTypes: [String: Double] = [
        "Milligram": 1_000_000,
        "Gram": 1000,
        "Kilogram": 1,
        "Tonne": 0.001,
        "Ounce": 35.274,
        "Pound": 2.20462,
        "Stone": 0.157473
    ]
    

    var temperatureTypes: [String: Double] = ["Celsius": 1, "Fahrenheit": 1,"Kelvin": 1]
}
