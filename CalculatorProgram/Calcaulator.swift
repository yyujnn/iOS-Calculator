
//
//  Calculator.swift
//  Calculator
//
//
import Foundation

class DecimalCalculator: Calculator {
    
    var isCalculatable: Bool = true
    var number = Stack<Double>()        // 숫자 저장 스택
    var operatorCode = Stack<String>()  // 연산자 저장 스택
    var insertNumber = ""               // 현재 입력 숫자
    var viewNumber = "0"                // 사용자 보여지는 숫자
    
    var lastOperatorCode: String?       // =
    var isConsecutiveEquals = false     // = 여러번 입력
    var initNum: String = ""
    
    
    var binaryOperationFunctions: [String: BinaryOperator] = [:]
    var unaryOperationFunctions: [String: UnaryOperator] = [:]
    
    init() {
        binaryOperationFunctions["+"] = AdditionOperator()
        binaryOperationFunctions["-"] = SubtractionOperator()
        binaryOperationFunctions["x"] = MultiplicationOperator()
        binaryOperationFunctions["÷"] = DivisionOperator()
        
        unaryOperationFunctions["%"] = PercentOperator()
        unaryOperationFunctions["+/-"] = NegationOperator()
    }
    
    // MARK: - Stack
    
    func reset() {
        number.clear()
        operatorCode.clear()
        insertNumber = ""
        viewNumber = "0"
    }
    
    func clear() {
        if insertNumber.isEmpty {
            // 입력중인 숫자 x (연산자 입력 가정)
            if !operatorCode.isEmpty() {
                operatorCode.removeLast()
                // 연산자 삭제
            }
        } else {
            // 숫자 입력시 삭제
            insertNumber = ""
        }
        updatedViewNumber()
    }
    
    
    func pushNumber() {
        if let doubleNumber = Double(insertNumber) {
            number.push(doubleNumber)
            insertNumber = ""
        }
    }
    
    // 사용자에게 보여주는 숫자
    // 1. 숫자입력 -> 입력한 숫자
    // 2. 연산자 or = 입력 -> 연산 값으로 update
    func updatedViewNumber() {
        guard let lastNumber = number.top() else { return }
        viewNumber = lastNumber.formatResult()
    }
    
    // MARK: - Calculation
    
    func calculate() throws {
        guard let operatorSign = operatorCode.pop(),
              let operationFunction = binaryOperationFunctions[operatorSign],
              let secondNumber = number.pop(),
              let firstNumber = number.pop() else {
            return
        }
        
        if operatorSign == "÷" && secondNumber == 0 {
                throw CalculationError.divisionByZero
            }
        
        let result = operationFunction.operate(firstNumber, secondNumber)
        number.push(result)
    }
    
    // 연산자 우선순위
    private func getPriority(_ code: String) -> Int? {
        switch code {
        case "+", "-":
            return 1
        case "x", "÷":
            return 2
        default:
            return nil
        }
    }
    
    func calculateRule(code: String) {
        // 연산자 중복 검사 추가
        if insertNumber.isEmpty && !operatorCode.isEmpty() && operatorCode.top() != code {
                operatorCode.removeLast()  // 중복 연산자 교체
            }
        
        pushNumber()

        guard let currentPriority = getPriority(code) else {
            return  // 우선순위 가져올 수 없을 때
        }

        // 스택 가장 위 연산자와 현재 연산자 비교
        while let topOperator = operatorCode.top(),
              let topPriority = getPriority(topOperator),
              currentPriority <= topPriority {
            tryingCalculate {
                try calculate()
            }
            // ex) +가 입력됐다면 원래 있던 x 연산 우선 진행
        }
        operatorCode.push(code)
        insertNumber = ""
        
    }
    
    func inputEqualButton() {

        // 두번째 숫자 없이 "=" 입력
        if insertNumber.isEmpty && !operatorCode.isEmpty(){
            if let lastResult = number.top() {
                insertNumber = lastResult.formatResult()
                initNum = insertNumber
                lastOperatorCode = operatorCode.top()
            }
        }
        
        // "=" 버튼 연속으로 눌릴 때 이전 결과와 연산자로 연산
         if isConsecutiveEquals && operatorCode.isEmpty() {
             if let lastOperator = lastOperatorCode {
                 operatorCode.push(lastOperator)
                 insertNumber = initNum
                 pushNumber()
             } else {
                 return
             }
         }

        // 숫자 입력 후 "=" 입력
        pushNumber()
        
        // 남은 연산자 처리
        while !operatorCode.isEmpty() {
            tryingCalculate {
                try calculate()
            }
        }

        if let result = number.top() {
            let formattedResult = result.formatResult()
            insertNumber = formattedResult
        }
        
        isConsecutiveEquals = true
    }
    
    
    func concatNumber(_ title: String) {
        if insertNumber.count < 9 {
            insertNumber += title
            viewNumber = insertNumber.formatViewNumber()
        }
    }
    
    func concatDot(_ title: String) {
        if insertNumber == "" && title == "."{
            insertNumber = "0."
        }
        if !insertNumber.contains(".") {
            insertNumber += "."
        }
    }
    
    // 단항 연산자 메서드
    func calculateUnary(code: String) {
        guard let operation = unaryOperationFunctions[code],
              let currentNumber = Double(insertNumber) else {
            insertNumber = "input error"
            viewNumber = insertNumber.formatViewNumber()
            return
        }
        
        let result = operation.operate(currentNumber)
        insertNumber = result.formatResult()
        viewNumber = insertNumber.formatViewNumber()
    }
    
}

