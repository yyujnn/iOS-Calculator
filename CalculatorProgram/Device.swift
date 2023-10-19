//
//  CalculatorDevice.swift
//  CalculatorProgram
//

import Foundation

class Device: DecimalCalculator {
    
    func inputButton(title: String) {
        switch title {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            concatNumber(title)
            viewNumber = insertNumber.formatViewNumber()
        case ".":
            concatDot(title)
            viewNumber = insertNumber.formatDotNumber()
        case "+", "-", "x", "÷":
            calculateRule(code: title)
            updatedViewNumber()
        case "AC":
            reset()
        case "C":
            clear()
        case "=":
            inputEqualButton()
            updatedViewNumber()
        case "%":
            calculateUnary(code: "%")
        case "+/-":
            calculateUnary(code: "+/-")
        default:
            insertNumber = "input error"
        }
    }
}
