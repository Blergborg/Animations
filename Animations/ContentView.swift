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
        VStack {
            Button("Tap Me") {
//                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            // custom animation for a pulse off the button
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                // makes the pulse animation start once button view is available
                animationAmount = 2
            }
            /*
             // custom animation modifier that makes button grow and shrink 3x when pressed
            .animation(
                .easeInOut(duration: 1)
//                    .delay(1)
//                    .repeatCount(3, autoreverses: true),
                    .repeatForever(autoreverses: false),
                value: animationAmount
            )
            // custom animation that makes button grow and shrink in a spring-y motion.
//            .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
             */
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
