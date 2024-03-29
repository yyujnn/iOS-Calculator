//
//  CalculatorDevice.swift
//  CalculatorProgram
//

import Foundation


class Device: DecimalCalculator, CalculatorDevice {
    
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
            do {
                try errorManager.tryingInput()
               } catch InputError.inputError {
                   insertNumber = "input error"
                   print("입력할 수 있는 형식이 아닙니다.")
               } catch {
                   print("에러 발생: \(error)")
               }
        }
    }
}
