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
        
        for p in minPos...maxPos {
            var _map = map
                for cm in _map {
                    let dp = (p - cm.key).signum()
                    results.updateValue(((results[p] ?? 0) + ( p - cm.key) * dp * cm.value.count ), forKey: p)
                    _map[cm.key] = []
                }
        }
        
        return results.filter({$0.key > 0}).values.min()!
    }
    
    func day7part2() -> Int {
        
        let data = input.first!.split(separator: ",").map({Int($0.description)!})
        let map = data.reduce(into: [Int: [CrabMarine]]()) { $0[$1] = ($0[$1] ?? []) + [CrabMarine()] }
        let (minPos, maxPos) = (data.min()!, data.max()!)
        var results = Array(minPos...maxPos).reduce(into: [Int: Int]()) { $0[$1] = 0 }
        
        for p in minPos...maxPos {
            var _map = map
                for cm in _map {
                    let dp = (p - cm.key).signum()
                    // :]]]]]
                    results.updateValue(((results[p] ?? 0) + Array(0...( p - cm.key) * dp).reduce(0, +) * cm.value.count ), forKey: p)
                    _map[cm.key] = []
                }
        }
        
        return results.filter({$0.key > 0}).values.min()!
    }
}
