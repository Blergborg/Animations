//
//  ContentView.swift
//  Animations
//
//  Created by Phil Prater on 9/2/23.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        // can apply animation to each individual letter to make a Slinky-like effect when dragging the word container around.
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
        /*
        // Basic Card with drag gesture that springs back to original spot when drag ends.
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            // offset modifier allow a View's position to change, w/o affecting other Views.
            .offset(dragAmount)
            // adding gesture support for a View
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in  // remember, this says ignore args
                        // explicit animation
                        withAnimation(.spring()) {
                            dragAmount = .zero
                        }
                    }
            )
        // applied animation
//            .animation(.spring(), value: dragAmount)
       */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
