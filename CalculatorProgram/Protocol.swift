//
//  Protocol.swift
//  Calculator
//

/*
 Calculator 계산기 추상화
 연산이 가능해야 한다 ex) + - ÷ x

 각 연산이 따로 구동될 수 있게 분리하여 추상화
 device 인터페이스 -> 버튼 메서드 구현 (숫자, 연산기호)
 유닛테스트 가능하게 메서드 구현 + 계산기 객체로 테스트 가능하게 구현

 [기능]
 1. 연산 가능
 1-1. 연산을 위한 스택 필요
 1-2. 연산자 우선 순위에 따라 처리
 2. 입력 처리
 2-1. 음수 및 소수 계산 가능
 3. 결과
 3-1. 정수 및 소수 자리수 제한

 [예외 사항]
 0으로 나눌 때 에러 처리
 문자 입력 시 에러 처리

 [기능 상세]
 연산자 여러번 선택시 마지막 연산자로 계산
 입력 숫자 길이 9자리 제한
 "=" 게속 입력시 연속 연산

 [아이폰 계산기]
 AC +- % ÷
 7  8  9 x
 4  5  6 -
 1  2  3 +

*/

import Foundation

protocol Calculatable {
    var isCalculatable: Bool { get set }
}

protocol CalculatorData {
    var number: Stack<Double> { get set }
    var operatorCode: Stack<String> { get set }
}

protocol Calculator: Calculatable, CalculatorData {
    func calculate () throws
}

protocol CalculatorDevice {
    func inputButton(title: String)
}

protocol BinaryOperator {
    var symbol: String { get }
    func operate(_ a: Double, _ b: Double) -> Double
}

protocol UnaryOperator {
    var symbol: String { get }
    func operate(_ value: Double) -> Double
}

protocol Input {
    func clicked()
}



