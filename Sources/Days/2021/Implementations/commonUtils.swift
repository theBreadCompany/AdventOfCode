//
//  File.swift
//  
//
//  Created by Fabio Mauersberger on 13.12.21.
//

import Foundation

struct Point: Hashable {
    var x: Int
    var y: Int
}

struct CharPair: Hashable, Equatable {
    var left: Character
    var right: Character
    
    init(_ l: Character, _ r: Character) {
        left = l
        right = r
    }
}

extension String {
    func toArray() -> Array<String> {
        return self.map({String($0)})
    }
        func toInt() -> Int! {
            return Int(self)!
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

extension String {
    public func adjacentPairs() -> [(Character, Character)] {
        let pairs = Array(0...self.count-2).map({(Character(self[$0]), Character(self[$0+1]))})
        return pairs
    }
}

extension String {
    subscript(pos: Int) -> String {
        return Array(self)[pos].description
    }
}

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

extension Substring {
    func toArray() -> Array<String> {
        return Array(self.map({String($0)}))
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

extension Array {
    public static func +=(lhs: inout Array<Element>, rhs: Element) {
        lhs.append(rhs)
    }
}

extension Int {
    func gauss(_ n: Int) -> Int { return ((self*(self+n))/2) }
}
