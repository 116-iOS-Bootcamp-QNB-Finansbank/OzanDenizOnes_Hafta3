//
//  Operators.swift
//  BasicUIComponents
//
//  Created by Ozan Deniz Ones on 13.09.2021.
//

import UIKit

class MathOperations {
    
    var result: String = ""
    
    func Addition(firstValue: Double, secondValue: Double) -> String {
        result = String(firstValue + secondValue)
        return result
    }
    
    func Subtract(firstValue: Double, secondValue: Double) -> String {
        result = String(firstValue - secondValue)
        return result
    }
    
    func Multiply(firstValue: Double, secondValue: Double) -> String {
        result = String(firstValue * secondValue)
        return result
    }
    
    func Divide(firstValue: Double, secondValue: Double) -> String {
        
        if secondValue != 0 {
            result = String(firstValue / secondValue)
            return result
        }
        return "0 DIVISION ERROR"
        
    }
}
