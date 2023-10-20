//
//  Error.swift
//  CaculatorProgram
//

import Foundation

enum CalculationError: Error {
    case divisionByZero
}

enum InputError: Error {
    case inputError
}

class ErrorManager {
    func tryingCalculate(calculate: () throws -> Void) {
        do {
            try calculate()
        } catch CalculationError.divisionByZero {
            print("0으로 나눌 수 없습니다.")
        } catch {
            print("에러 발생: \(error)")
        }
    }
    
    func tryingInput() throws {
        throw InputError.inputError
    }
    
}
