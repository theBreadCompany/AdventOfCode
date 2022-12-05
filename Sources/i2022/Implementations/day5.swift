//
//  day5.swift
//  
//
//  Created by Fabio Mauersberger on 05.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    func arrangeCrates(pickMultipleCrates: Bool = false) -> NSString {
        
        guard let s = input.firstIndex(where: {$0.isEmpty}) else { fatalError("Missing separator line!") }

        let _crates = input[..<(s-1)]
            .map({$0.replacingOccurrences(of: "    ", with: " [#]")})
            .map({$0.components(separatedBy: " ").filter({!$0.isEmpty})})
        
        var crates = Array<Array<String>>()
        for x in 0..._crates[0].count-1 {
            crates.append(Array<String>())
            for y in 0..._crates.count-1 {
                crates[x].append(_crates[y][x])
            }
        }
        crates = crates
            .map({$0.filter({$0 != "[#]"}).reversed()})

        let instructions = input[(s+1)..<input.count-1]
            .map({$0.components(separatedBy: CharacterSet.decimalDigits.inverted)
                .compactMap({Int($0)})})

        for instruction in instructions {
            let stack = crates[instruction[1]-1]
            crates[instruction[1]-1] = Array(instruction[0] == stack.count ? [] : stack[..<(stack.count-instruction[0])])
            let c = stack[((stack.count-1)-(instruction[0]-1))...]
            crates[instruction[2]-1].append(contentsOf: pickMultipleCrates ? Array(c) : Array(c.reversed()))
        }
        
        return crates.compactMap({$0.last}).joined().replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "") as NSString
    }
    
    func day5part1() -> NSString {
        arrangeCrates()
    }
    
    func day5part2() -> NSString {
        arrangeCrates(pickMultipleCrates: true)
    }
}
