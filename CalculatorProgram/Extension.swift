//
//  Extension.swift
//  CaculatorProgram
//

import Foundation

extension Double {
    func formatResult() -> String {
        
        if self.isNaN || self.isInfinite {
            return "Error"
        }

        // 1. 소수점 8자자리까지
        var formattedResult = String(format: "%.8f", self)

        // 2. 연속되는 0 문자열 마지막부터 제거
        while formattedResult.hasSuffix("0") {
            formattedResult = String(formattedResult.dropLast())
        }

        // 3. 정수 결과는 소수점 제거
        if formattedResult.hasSuffix(".") {
            formattedResult = String(formattedResult.dropLast())
        }

        return formattedResult
    }
}

// (Double(insertNumber)?.formatResult())!
extension String {
    
    func formatViewNumber() -> String {
        if let doubleValue = Double(self) {
            return doubleValue.formatResult()
        } else {
            return "Error"
        }
    }
    
    func formatDotNumber() -> String {
        if let doubleValue = Double(self) {
            var formattedValue = doubleValue.formatResult()
            if self.hasSuffix(".") {
                formattedValue += "."
            }
            return formattedValue
        } else {
            return "Error"
        }
    }
}

/*
 hasSuffix() : String 지정된 문자로 끝나는 여부 Boolean값으로 반환
 dropLast() : 마지막 요소 제외한 나머지 요소의 시퀀스 반환
 */


