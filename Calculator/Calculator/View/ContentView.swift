//
//  ContentView.swift
//  Calculator
//
//  Created by Gurjinder Singh on 28/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.8), .yellow.opacity(0.5)]), startPoint: UnitPoint.top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            KeyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
