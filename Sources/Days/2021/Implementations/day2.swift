//
//  day2.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

extension Day {
    
    func day2part1() -> Int {
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
        return hPos*depth
    }
    
    func day2part2() -> Int {
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
        
        return hPos*depth
    }
}
