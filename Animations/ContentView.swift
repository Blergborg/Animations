//
//  ContentView.swift
//  Animations
//
//  Created by Phil Prater on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = true
    
    var body: some View {
        
        return VStack {
            // NOTE: Only changes that occur BEFORE the .animation() modifier actually get animated.
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            // passing 'nil' as the animation disables them entirely (for changes BEFORE modifier)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            // we can have multiple animation modifiers, will only animate things after the previous animation modifier.
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
