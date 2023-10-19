//
//  Stack.swift
//  Calculator
//
//  Created by imac on 2023/10/17.
//

import Foundation

struct Stack<T> {
    var items = Array<T>()
    
    var count: Int {
        return items.count
    }
    
    mutating func push(_ T: T) {
        items.append(T)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    mutating func clear() {
        items.removeAll()
    }

    func top() -> T? {
        return items.last
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

