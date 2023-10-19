//
//  Error.swift
//  CaculatorProgram
//

import Foundation

enum CalculationError: Error {
    case divisionByZero
}

enum InputError: Error {
    case invalidInput
}


func tryingCalculate(calculate: () throws -> Void) {
    do {
        try calculate()
    } catch CalculationError.divisionByZero {
        print("0으로 나눌 수 없습니다.")
    } catch {
        print("에러 발생: \(error)")
    }
}


func tryingInput(inputButton: () throws -> Void) {
    do {
        try inputButton()
    } catch InputError.invalidInput {
        print("입력할 수 있는 형식이 아닙니다.")
    } catch {
        print("에러 발생: \(error)")
    }
}

