//
//  ContentView.swift
//  Animations
//
//  Created by Phil Prater on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        print(animationAmount)
        return VStack {
            
            Button("Tap Me") {
                // explicitly invoke the animation
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 360
                }
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            // animation that rotates around the axis (or axies) selected by a specified radial amount
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: -1, z: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
