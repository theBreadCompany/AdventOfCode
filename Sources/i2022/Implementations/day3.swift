//
//  day3.swift
//  
//
//  Created by Fabio Mauersberger on 03.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    func day3part1() -> NSNumber {
        var score: UInt32 = 0
        for line in input {
            let line = line.map({$0})
            let fc = line.dropLast(line.count/2)
            let sc = line.dropFirst(line.count/2)
            guard line.count % 2 == 0 else { fatalError() }
            for letter in fc {
                if sc.contains(letter) {
                    if letter.isLowercase {
                        score += UInt32(letter.asciiValue!) - 96
                    } else {
                        score += UInt32(letter.asciiValue!) - 38
                    }
                    break
                }
            }
        }
        return NSNumber(value: score);
    }
    
    func day3part2() -> NSNumber {
        var score: UInt32 = 0
        var i = 0
        while i < input.count-1 {
            let commons = Set(input[i]).intersection(input[i+1]).intersection(input[i+2])
            for l in commons {
                if l.isLowercase {
                    score += UInt32(l.asciiValue!) - 96
                } else {
                    score += UInt32(l.asciiValue!) - 38
                }
            }
            i += 3
        }
        return NSNumber(value: score)
    }
}
