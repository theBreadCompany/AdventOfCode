//
//  day2.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

@objc
extension Day {
    
    func year2021day2part1() -> NSNumber {
        var hPos = 0
        var depth = 0
        
        for (i, val) in input.enumerated() {
            if val.contains("forward") {
                hPos += Int(input[i].split(separator: " ").last!.description)!
            }
            if val.contains("up") {
                depth -= Int(input[i].split(separator: " ").last!.description)!
            }
            if val.contains("down") {
                depth += Int(input[i].split(separator: " ").last!.description)!
            }
        }
        return NSNumber(value: hPos*depth)
    }
    
    func year2021day2part2() -> NSNumber {
        var hPos = 0
        var depth = 0
        var aim = 0

        for (i, val) in input.enumerated() {
            if val.contains("forward") {
                hPos += Int(input[i].split(separator: " ").last!.description)!
                depth += aim * Int(input[i].split(separator: " ").last!.description)!
            }
            if val.contains("up") {
                aim -= Int(input[i].split(separator: " ").last!.description)!
            }
            if val.contains("down") {
                aim += Int(input[i].split(separator: " ").last!.description)!
            }
        }
        
        return NSNumber(value: hPos*depth)
    }
}
