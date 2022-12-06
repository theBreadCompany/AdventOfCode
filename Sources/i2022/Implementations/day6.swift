//
//  day6.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    func day6part1() -> NSNumber {
        NSNumber(value:input[0].enumerated().first(where: { i, _ in Set(Array(input[0])[i..<i+4]).count == 4})!.offset+4) // yes, the parser is hardcoded to the first input line; yes, the bad result is -1
    }
    
    func day6part2() -> NSNumber {
        NSNumber(value:input[0].enumerated().first(where: { i, _ in Set(Array(input[0])[i..<i+14]).count == 14})!.offset+14) // yes, the parser is hardcoded to the first input line; yes, the bad result is -1
    }
}
