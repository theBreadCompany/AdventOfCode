//
//  day7.swift
//  
//
//  Created by Fabio Mauersberger on 07.12.21.
//

import Foundation

extension Day {
    
    fileprivate struct CrabMarine: Hashable {
        let id = UUID()
    }
    
    func day7part1() -> Int {
        
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
        
        return results.filter({$0.key > 0}).values.min()!
    }
    
    func day7part2() -> Int {
        
        func gauss(_ n: Int) -> Int { return ((n)*(n+1)/2) }
        
        let data = input.first!.split(separator: ",").map({Int($0.description)!})
        let map = data.reduce(into: [Int: [CrabMarine]]()) { $0[$1] = ($0[$1] ?? []) + [CrabMarine()] }
        let (minPos, maxPos) = (data.min()!, data.max()!)
        var results = Array(minPos...maxPos).reduce(into: [Int: Int]()) { $0[$1] = 0 }
        
        for pos in minPos...maxPos {
            var _map = map
            for crabSubmarines in _map {
                let dpos = (pos - crabSubmarines.key) * (pos - crabSubmarines.key).signum()
                // the far far far slower approach: Array(0...( p - cm.key) * dp).reduce(0, +) :]]]
                results.updateValue(((results[pos] ?? 0) + gauss(dpos) * crabSubmarines.value.count ), forKey: pos)
                _map.updateValue([], forKey: crabSubmarines.key)
            }
        }
        
        return results.filter({$0.key > 0}).values.min()!
    }
}
