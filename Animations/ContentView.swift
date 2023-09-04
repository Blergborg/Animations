//
//  ContentView.swift
//  Animations
//
//  Created by Phil Prater on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        return VStack {
            // Tapping triggers animation b/c we attached a .animation() modifier to the binding variable
            Stepper("Scale amount", value:
                    $animationAmount.animation(), in: 1...10)

            Spacer()

            // Tapping button changes size immediately
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
