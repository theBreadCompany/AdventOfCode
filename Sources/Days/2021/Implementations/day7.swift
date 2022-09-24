//
//  day7.swift
//  
//
//  Created by Fabio Mauersberger on 07.12.21.
//

import Foundation

@objc
extension Day {
    
    fileprivate struct CrabMarine: Hashable {
        let id = UUID()
    }
    
    func year2021day7part1() -> NSNumber {
        
        let data = input.first!.split(separator: ",").map({Int($0.description)!})
        let map = data.reduce(into: [Int: [CrabMarine]]()) { $0[$1] = ($0[$1] ?? []) + [CrabMarine()] }
        let (minPos, maxPos) = (data.min()!, data.max()!)
        var results = Array(minPos...maxPos).reduce(into: [Int: Int]()) { $0[$1] = 0 }
        
        for pos in minPos...maxPos {
            var _map = map
            for crabSubmarines in _map {
                let dpos = (pos - crabSubmarines.key) * (pos - crabSubmarines.key).signum()
                results.updateValue(((results[pos] ?? 0) + dpos * crabSubmarines.value.count), forKey: pos)
                _map.updateValue([], forKey: crabSubmarines.key)
            }
        }
        
        return NSNumber(value: results.filter({$0.key > 0}).values.min()!)
    }
    
    func year2021day7part2() -> NSNumber {
        
        let data = input.first!.split(separator: ",").map({Int($0.description)!})
        let map = data.reduce(into: [Int: [CrabMarine]]()) { $0[$1] = ($0[$1] ?? []) + [CrabMarine()] }
        let (minPos, maxPos) = (data.min()!, data.max()!)
        var results = Array(minPos...maxPos).reduce(into: [Int: Int]()) { $0[$1] = 0 }
        
        for pos in minPos...maxPos {
            var _map = map
            for crabSubmarines in _map {
                let dpos = (pos - crabSubmarines.key) * (pos - crabSubmarines.key).signum()
                // the far far far slower approach: Array(0...( p - cm.key) * dp).reduce(0, +) :]]]
                results.updateValue(((results[pos] ?? 0) + dpos.gauss(1) * crabSubmarines.value.count ), forKey: pos)
                _map.updateValue([], forKey: crabSubmarines.key)
            }
        }
        
        return NSNumber(value: results.filter({$0.key > 0}).values.min()!)
    }
}
