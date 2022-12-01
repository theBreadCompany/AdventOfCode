//
//  day8.swift
//
//
//  Created by Fabio Mauersberger on 08.12.21.
//

import Foundation

@objc
extension Y2021 {
    
    func day8part1() -> NSNumber {
        let outVals = input.compactMap({$0.split(separator: "|").last!})
        
        var count = 0
        for vals in outVals {
            for val in vals.split(separator: " ") {
                if val.count == 2 || val.count == 3 || val.count == 4 || val.count == 7 {
                    count += 1
                }
            }
        }
        return NSNumber(value: count)
    }
    
    func day8part2() -> NSNumber {
        
        func solve(_ s: [String], using hints: [String]) -> Int {
            
            var solved = Array(0...9).reduce(into: [Int: String]()) { $0[$1] = ""}
            solved.updateValue(hints.first(where: {$0.count == 2})!, forKey: 1)
            solved.updateValue(hints.first(where: {$0.count == 3})!, forKey: 7)
            solved.updateValue(hints.first(where: {$0.count == 4})!, forKey: 4)
            solved.updateValue(hints.first(where: {$0.count == 7})!, forKey: 8)
            solved.updateValue(hints.first(where: {solved[1]!.toSet().isSubset(of: $0.toSet()) && $0.toSet().count == 5})!, forKey: 3)
            solved.updateValue(hints.first(where: {solved[3]!.toSet().isSubset(of: $0.toSet()) && $0.toSet().count == 6})!, forKey: 9)
            solved.updateValue(hints.first(where: {$0.toSet() == solved[8]!.toSet().subtracting(solved[4]!.toSet()).union(solved[1]!.toSet()).union(solved[8]!.toSet().subtracting(solved[3]!.toSet()))})!, forKey: 0)
            
            var _hints = hints.filter({!solved.values.map({$0.toSet()}).contains($0.toSet())})
            solved.updateValue(_hints.first(where: {$0.count == 6})!, forKey: 6)
            solved.updateValue(solved[6]!.toSet().subtracting(solved[8]!.toSet().subtracting(solved[9]!.toSet())).joined(separator: ""), forKey: 5)
            _hints = hints.filter({!solved.values.map({$0.toSet()}).contains($0.toSet())})

            solved.updateValue(_hints.first!, forKey: 2)
            
            var _s = s
            for (i, val) in s.enumerated() {
                for (key, dVal) in solved {
                    if Set(val) == Set(dVal) {
                        _s[i] = key.description
                    }
                }
            }
            return Int(_s.joined(separator: ""))!
        }
        
        var count = 0
        for i in input {
            count += solve(i.split(separator: "|").last!.split(separator: " ").map({(String($0))}), using: i.split(separator: "|").first!.split(separator: " ").map({String($0)}))
        }
        
        return NSNumber(value: count)
    }
}

extension String {
    func toSet() -> Set<String> {
        return Set(self.map({String($0)}))
    }
}
