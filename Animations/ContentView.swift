//
//  ContentView.swift
//  Animations
//
//  Created by Phil Prater on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale) // NOTE: insert animation work when actually running the simulator, preview is broken for some reason?
                // .asymmetric modifier allows us to use different transitions for view entrance vs exit.
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
