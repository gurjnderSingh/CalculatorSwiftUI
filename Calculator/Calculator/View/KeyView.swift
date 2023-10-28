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
        VStack(spacing: 13) {
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(changeColor ? Color("num").opacity(0.5) : .pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.2 : 1.0)
                    .frame(width: 350, height: 280)
                    .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
                    .onAppear {
                        print("calling")
                        self.changeColor.toggle()
                    }
                    .overlay {
                        Text(value)
                            .bold()
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                }
            }.padding()
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { element in
                        Button {
                            didTap(key: element)
                        } label: {
                            Text(element.rawValue)
                                .font(.system(size: 30))
                                .frame(width: getButtonWidth(key: element), height: 60)
                                .background(element.buttonColor)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }

                    }
                }
            }
        }
    }
    
    func getButtonWidth(key: Keys)-> CGFloat {
        if key == .zero {
            return (UIScreen.main.bounds.width - (5*10)) / 2
        }
        return (UIScreen.main.bounds.width - (5*10)) / 4
    }
    
    func didTap(key: Keys) {
        switch key {
        case .add, .sub, .mul, .div, .equal:
            if key == .add {
                self.currentOperation = .add
                self.runningNumber = Int(value) ?? 0
            } else if key == .sub {
                self.currentOperation = .sub
                self.runningNumber = Int(value) ?? 0
            } else if key == .mul {
                self.currentOperation = .mul
                self.runningNumber = Int(value) ?? 0
            } else if key == .div {
                self.currentOperation = .div
                self.runningNumber = Int(value) ?? 0
            } else if key == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(value) ?? 0
                
                switch self.currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .sub:
                    self.value = "\(runningValue - currentValue)"
                case .mul:
                    self.value = "\(runningValue * currentValue)"
                case .div:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if key != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent:
            break
        default:
            let number = key.rawValue
            if self.value == "0" {
                self.value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
