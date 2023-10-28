//
//  KeyView.swift
//  Calculator
//
//  Created by Gurjinder Singh on 28/10/23.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operations = .none
    @State var changeColor: Bool = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative, .percent, .div],
        [.seven, .eight, .nine, .mul],
        [.four, .five, .six, .sub],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(changeColor ? Color("num").opacity(0.5) : .pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
                    .onAppear {
                        self.changeColor.toggle()
                    }
                    .overlay {
                        Text(value)
                            .bold()
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                }
            }
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
      
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
