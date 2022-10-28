//
//  ContentView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State private var selectedHue = 0.0
    
    // MARK: Computed properties
    
    // The selected hue expressed as a value between 0.0 and 1.0
    private var hue: Double {
        return selectedHue / 360.0
    }
    
    // Make the colour that SwiftUI will use to set the background of the colour swatch
    private var baseColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.9)
    }

    private var darkerColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.6)
    }

    private var evenDarkerColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.3)
    }

    // Interface
    var body: some View {
        VStack {
            
            HStack {
                ColourSwatchView(colour: baseColour,
                                 size: 150)
                
                VStack {
                    Text("Hue")
                        .bold()
                    
                    Text("\(selectedHue.formatted(.number.precision(.fractionLength(1))))°")
                }
                
                Slider(value: $selectedHue,
                       in: 0...360,
                       label: { Text("Hue") },
                       minimumValueLabel: { Text("0") },
                       maximumValueLabel: { Text("360") })
                
            }
            
            
            Text("Monochromatic")
                .bold()
            
            HStack(spacing: 0) {
                
                ColourSwatchView(colour: baseColour,
                                 size: 50)

                ColourSwatchView(colour: darkerColour,
                                 size: 50)
                
                ColourSwatchView(colour: evenDarkerColour,
                                 size: 50)

                Spacer()
            }
            
            Spacer()
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
