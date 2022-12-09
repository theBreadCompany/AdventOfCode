//
//  day1.swift
//  
//
//  Created by Fabio Mauersberger on 01.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    public func day1part1() -> NSNumber {
        var nmax = 0
        var nc = 0
        for number in input {
            if let number = Int(number) {
                nc += number
            } else {
                nmax = nc > nmax ? nc : nmax
                nc = 0
            }
        }
        return NSNumber(value: nmax)
    }
    
    public func day1part2() -> NSNumber {
        var ns = Array<Int>()
        var nc = 0
        for number in input {
            if let number = Int(number) {
                nc += number
            } else {
                ns.append(nc)
                nc = 0
            }
        }
        return NSNumber(value: ns.sorted()[ns.count-3...ns.count-1].reduce(0, +))
    }
}
