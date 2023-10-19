//
//  Button.swift
//  Calculator
//
//  Created by imac on 2023/10/17.
//

import Foundation

// MARK: Device 임시 버튼 인터페이스 -> 버튼 메서드
// 계산기 로직과 사용자 인터페이스 분리
// 사용자 인터페이스는 버튼 클릭에 따라 해당 동작호출

class Button: Input {
    let title: String
    let action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    func clicked() {
        action()
    }
}

let decimalCalculator = Device()

var numButtons: [Button] = []
func createButtons() {
    for i in 0...9 {
        numButtons.append(Button(title: "\(i)") {
            decimalCalculator.inputButton(title: "\(i)")
        })
    }
}

let dotButton = Button(title: ".") {
    decimalCalculator.inputButton(title: "0")
}

let acButton = Button(title: "AC") {
    decimalCalculator.inputButton(title: "AC")
}

let clearButton = Button(title: "C") {
    decimalCalculator.inputButton(title: "C")
}

let equalButton = Button(title: "=") {
    decimalCalculator.inputButton(title: "=")
}

let nagationButton = Button(title: "+/-") {
    decimalCalculator.inputButton(title: "+/-")
}

let addButton = Button(title: "+") {
    decimalCalculator.inputButton(title: "+")
}

let subButton = Button(title: "-") {
    decimalCalculator.inputButton(title: "+")
}

let divButton = Button(title: "÷") {
    decimalCalculator.inputButton(title: "÷")
}

let mulButton = Button(title: "x") {
    decimalCalculator.inputButton(title: "x")
}

let perButton = Button(title: "%") {
    decimalCalculator.inputButton(title: "%")
}


