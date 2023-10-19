//
//  main.swift
//  CaculatorProgram
//

import Foundation

// [기본 연산자 테스트]

func testAdd() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let addResult = testAdd()
print("add: \(addResult)") // 8

func testSub() -> String {
    let calculator = Device()
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "0")
    calculator.inputButton(title: "-")
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let subResult = testSub()
print("sub: \(subResult)") // 27

func testDiv() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "0")
    calculator.inputButton(title: "÷")
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let divResult = testDiv()
print("div: \(divResult)") // 16.66666667

func testMul() -> String {
    let calculator = Device()
    calculator.inputButton(title: "3")
    calculator.inputButton(title: ".")
    calculator.inputButton(title: "8")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let MulResult = testMul()
print("mul: \(MulResult)") // 11.4

func testDot() -> String {
    let calculator = Device()
//    calculator.inputButton(title: "0")
    calculator.inputButton(title: ".")
//    calculator.inputButton(title: "5")
//    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let dotResult = testDot()
print("dot: \(dotResult)") // 0.5

func testPercent() -> String {
    let calculator = Device()
    calculator.inputButton(title: "4")
    calculator.inputButton(title: "0")
    calculator.inputButton(title: "%")
    return calculator.viewNumber
}
let perResult = testPercent()
print("per: \(perResult)") // 0.4

func testNeg() -> String {
    let calculator = Device()
    calculator.inputButton(title: "9")
    calculator.inputButton(title: "+/-")
    return calculator.viewNumber
}
let negResult = testNeg()
print("neg: \(negResult)") // -9

func testClear() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "8")
//    calculator.inputButton(title: "+") //18
    calculator.inputButton(title: "C")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}

let clear = testClear()
print("clear: \(clear)") // 10

func testAC() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "8")
    calculator.inputButton(title: "AC")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}

let ac = testAC()
print("ac: \(ac)") // 0


// [연산자 우선순위 및 상태표시 테스트]

// 사칙연산 우선순위에 따른 연산 가능
// 5 x 6 + 2 = 32
// 5 + 6 x 2 = 17

// 사칙연산을 눌렀을 때 연산된 값에 대해 출력(스택에 저장)
// 5 x 6 x → 30
// 5 + 6 + → 11

func test1() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "6")
    calculator.inputButton(title: "+")
    print("중간 : \(calculator.viewNumber)")// 30
    calculator.inputButton(title: "2")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let result1 = test1()
print("test1: \(result1)") // 32

func test2() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "6")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "2")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}
let result2 = test2()
print("test2: \(result2)") // 17

func test3() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "6")
    calculator.inputButton(title: "x")
    return calculator.viewNumber
}
let result3 = test3()
print("test3: \(result3)") // 30

func test4() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "6")
    calculator.inputButton(title: "+")
    return calculator.viewNumber
}

let result4 = test4()
print("test4: \(result4)") // 11

func testMultiple() -> String {
    let calculator = Device()
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "9")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "8")
    calculator.inputButton(title: "-")
    calculator.inputButton(title: "7")
    calculator.inputButton(title: "÷")
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}

let multiple = testMultiple()
print("multiple: \(multiple)") // 73.6


// [Error 발생 테스트]

func charTest() -> String {
    let calculator = Device()
    calculator.inputButton(title: "아")
    return calculator.insertNumber
}

let char = charTest()
print("char: \(char)") // input error

// ÷ 0
func divZero() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "÷")
    calculator.inputButton(title: "0")
    calculator.inputButton(title: "=")
    return calculator.insertNumber
}

let zero = divZero()
print("zero: \(zero)") // 에러

// 연산자 연속 입력 -> 마지막 연산자로 변경
func lastCode() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "+")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "7")
    calculator.inputButton(title: "=")
    return calculator.viewNumber
}

let last = lastCode()
print("last: \(last)") // 35

// = 여러번
func testEqual() -> String {
    let calculator = Device()
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "x")
    calculator.inputButton(title: "=")
    calculator.inputButton(title: "=") // 125
    calculator.inputButton(title: "=") // 625
    return calculator.viewNumber
}

let equal = testEqual()
print("equal: \(equal)") // 8자리까지만


// 숫자 길이 제한
func countNum() -> String {
    let calculator = Device()
    calculator.inputButton(title: "1")
    calculator.inputButton(title: "2")
    calculator.inputButton(title: "3")
    calculator.inputButton(title: "4")
    calculator.inputButton(title: "5")
    calculator.inputButton(title: "6")
    calculator.inputButton(title: "7")
    calculator.inputButton(title: "8")
    calculator.inputButton(title: "9")
    calculator.inputButton(title: "10")
    return calculator.viewNumber
}

let count = countNum()
print("count: \(count)") // 8자리까지만
