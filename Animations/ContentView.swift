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
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)  // can now use our new "pivot" transiton
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

// creating a custom modifier for the transition
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint  // allows us to set the X/Y point of the anchor.
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)  // spins on Z axis.
            .clipped()  // prevents view from being drawn outside of its rectangular space.
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        // modifier transition allows us to 
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
