//
//  ContentView.swift
//  unitsConversion
//
//  Created by user204209 on 8/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var value = ""
    @State private var inputUnit = 3
    @State private var outputUnit = 6
    
    let unitArray = ["km", "hm", "dam", "m", "dm", "cm", "mm"]
    
    let convertedValue = "0"
    
    var outputMeasure: String {
        var inputValue: Measurement<UnitLength>
        var outputValue: Measurement<UnitLength>
        
        switch unitArray[inputUnit] {
        case "km":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.kilometers)
        case "hm":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.hectometers)
        case "dam":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.decameters)
        case "m":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.meters)
        case "dm":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.decimeters)
        case "cm":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.centimeters)
        case "mm":
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.millimeters)
        default:
            inputValue = Measurement(value: Double(value) ?? 0, unit: UnitLength.meters)
        }
        
        switch unitArray[outputUnit] {
        case "km":
            outputValue = inputValue.converted(to: UnitLength.kilometers)
        case "hm":
            outputValue = inputValue.converted(to: UnitLength.hectometers)
        case "dam":
            outputValue = inputValue.converted(to: UnitLength.decameters)
        case "m":
            outputValue = inputValue.converted(to: UnitLength.meters)
        case "dm":
            outputValue = inputValue.converted(to: UnitLength.decimeters)
        case "cm":
            outputValue = inputValue.converted(to: UnitLength.centimeters)
        case "mm":
            outputValue = inputValue.converted(to: UnitLength.millimeters)
        default:
            outputValue = inputValue.converted(to: UnitLength.meters)
        }
        
        let formartter = MeasurementFormatter()
        
        
        let measurement = "\(outputValue.value) \(formartter.string(from: outputValue.unit))"
        
        return measurement
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Value to be converted")) {
                    TextField("Enter value", text: $value)
                }
                
                Section(header: Text("Select input unit")) {
                    Picker("Select input unit", selection: $inputUnit) {
                        ForEach(0..<unitArray.count) {
                            Text("\(unitArray[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select output unit")) {
                    Picker("Select input unit", selection: $outputUnit) {
                        ForEach(0..<unitArray.count) {
                            Text("\(unitArray[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted value")) {
                    Text(outputMeasure)
                }
            }.navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
