//
//  day1.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

@objc
extension Y2021 {
    
    func day1part1() -> NSNumber {
        let numbers = input.compactMap { Int($0) }
        var increased = 0
        var oldNum = numbers.first!
        for i in numbers {
            if i > oldNum {
                increased += 1
            }
            oldNum = i
        }
        return NSNumber(value: increased)
    }
    
    @objc
    func day1part2() -> NSNumber {
        let numbers = input.compactMap { Int($0) }
        var increased = 0
        var oldNum = numbers[1] + numbers[1+1] + numbers[1+2]
        for i in 0...numbers.count-1 {
            if i + 2 < numbers.count {
                if numbers[i] + numbers[i+1] + numbers[i+2] > oldNum {
                    increased += 1
                }
                oldNum = numbers[i] + numbers[i+1] + numbers[i+2]
            }
        }
        return NSNumber(value: increased)
    }
    
}

