//
//  CalculatorModel.swift
//  Calculator
//
//  Created by Gurjinder Singh on 28/10/23.
//

import Foundation
import SwiftUI

enum Keys: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    
    case add = "+"
    case sub = "-"
    case div = "/"
    case mul = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .sub, .mul, .div, .equal:
            return Color("Voperator")
        case .clear, .negative, .percent:
            return Color("Hoperator")
        default:
            return Color("num")
        }
    }
}

enum Operations {
    case add, sub, div, mul, none
}
