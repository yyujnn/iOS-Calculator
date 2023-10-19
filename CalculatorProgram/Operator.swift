//
//  Operator.swift
//  CaculatorProgram
//

import Foundation

struct AdditionOperator: BinaryOperator {
    let symbol: String = "+"
    func operate(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}

struct SubtractionOperator: BinaryOperator {
    let symbol: String = "-"
    func operate(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
}

struct DivisionOperator: BinaryOperator {
    let symbol: String = "÷"
    func operate(_ a: Double, _ b: Double) -> Double {
        return a / b
    }
}

struct MultiplicationOperator: BinaryOperator {
    let symbol: String = "x"
    func operate(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
}

struct PercentOperator: UnaryOperator {
    let symbol: String = "%"
    func operate(_ value: Double) -> Double {
        return value / 100.0
    }
}

struct NegationOperator: UnaryOperator {
    let symbol: String = "+/-"
    func operate(_ value: Double) -> Double {
        return value * (-1)
    }
}


