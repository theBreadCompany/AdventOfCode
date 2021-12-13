//
//  File.swift
//  
//
//  Created by Fabio Mauersberger on 13.12.21.
//

import Foundation

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

struct Point: Hashable {
    var x: Int
    var y: Int
}

extension String {
    func toArray() -> Array<String> {
        return self.map({String($0)})
    }
    
    func toInt() -> Int {
        return Int(self)!
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

extension String {
    public func isLowercase() -> Bool {
        return self == self.lowercased()
    }
    public func isUppercase() -> Bool {
        return self == self.uppercased()
    }
}
