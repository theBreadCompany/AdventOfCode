//
//  day12.swift
//  
//
//  Created by Fabio Mauersberger on 12.12.21.
//

import Foundation

extension Day {
    
    fileprivate func parse(rawData: [String]) -> [String: Set<String>] {
        return rawData.reduce(into: [String: Set<String>]()) { result, line in
            let (left, right) = ( line.split(separator: "-").map({String($0)}).first!, line.split(separator: "-").map({String($0)}).last! )
            result.updateValue((result[left] ?? []) + right, forKey: left)
            result.updateValue((result[right] ?? []) + left, forKey: right)
        }
    }
    
    func routes(in caveSystem: [String:Set<String>], startingAt start: String, doubleAllowed: Bool, alreadyVisited done: [String]) -> Int {
        if start == "end" { return 1 }
        let nextCaves = caveSystem[start]!
        var paths = 0
        for cave in nextCaves {
            if cave == "start" { continue }
            else if !doubleAllowed && done.contains(cave) && cave.isLowercase() { continue }
            paths += routes(in: caveSystem, startingAt: cave, doubleAllowed: doubleAllowed && (cave.isUppercase() || !done.contains(cave)), alreadyVisited: done + cave)
            
        }
        return paths
    }
    
    func day12part1() -> Int {
        let caves = parse(rawData: input)
        return routes(in: caves, startingAt: "start", doubleAllowed: false, alreadyVisited: ["start"])
    }
    
    func day12part2() -> Int {
        let caves = parse(rawData: input)
        return routes(in: caves, startingAt: "start", doubleAllowed: true, alreadyVisited: ["start"])
    }
}

extension Set {
    public static func +(lhs: Set<Element>, rhs: Set<Element>) -> Set<Element> {
        return lhs.union(rhs)
    }
    public static func +(lhs: Set<Element>, rhs: Element) -> Set<Element> {
        return lhs + [rhs]
    }
}

extension Array {
    public static func +(lhs: Array<Element>, rhs: Array<Element>) -> Array<Element> {
        var lhs = lhs
        lhs.append(contentsOf: rhs)
        return lhs
    }
    public static func +(lhs: Array<Element>, rhs: Element) -> Array<Element> {
        return lhs + [rhs]
    }
}

extension String {
    public func isLowercase() -> Bool {
        return self == self.lowercased()
    }
    public func isUppercase() -> Bool {
        return self == self.uppercased()
    }
}
