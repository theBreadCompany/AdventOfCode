//
//  day14.swift
//
//
//  Created by Fabio Mauersberger on 14.12.21.
//

import AppKit

extension Day {
    
    fileprivate func parse(rawData: [String]) -> ([Character:Int], [[Character]:Int], [[Character]: Character]) {
        return (rawData.first!.reduce(into: [Character:Int]()) { (result, element) in
            result[element] = result[element, default: 0] + 1
        },
            rawData.first!.adjacentPairs().reduce(into: [[Character]:Int]()) { (result, element) in
            result[[element.0, element.1]] = result[[element.0, element.1], default: 0] + 1 },
                rawData[1...].reduce(into: [[Character]:Character]()) { (result, element) in
            let comps = element.components(separatedBy: " -> ")
            result.updateValue(comps.last!.first!, forKey: [comps.first!.first!, comps.first!.last!])
        })
    }
    
    fileprivate func react(_ input: [String], count: Int) -> Int {
        var (charCount, formula, rules) = parse(rawData: input)
        for _ in 0..<count {
            formula = formula.reduce(into: [:]) { (result, element) in
                let new = rules[element.key]!
                charCount[new] = charCount[new, default: 0] + element.value
                result[[element.key[0], new]] = result[[element.key[0], new], default: 0] + element.value
                result[[new, element.key[1]]] = result[[new, element.key[1]], default: 0] + element.value
            }
        }
        return charCount.values.max()!-charCount.values.min()!
    }
    
    @objc
    func year2021day14part1() -> NSNumber {
        return NSNumber(value: react(input, count: 10))
    }
    
    @objc
    func year2021day14part2() -> NSNumber {
        return NSNumber(value: react(input, count: 40))
    }
    
}
