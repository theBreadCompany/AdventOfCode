//
//  day2.swift
//  
//
//  Created by Fabio Mauersberger on 02.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    private func w(part2: Bool = false) -> [String:String] { part2 ? ["A": "B", "B": "C", "C": "A"] : ["A": "Y", "B": "Z", "C": "X"] }  // required letter to win
    private func s(part2: Bool = false) -> [String:Int] { part2 ? ["A": 1, "B": 2, "C": 3] : ["X": 1, "Y": 2, "Z": 3]  } // score equivalent for letter
    private func d() -> [String:String] { ["A": "X", "B": "Y", "C": "Z"] }  // required letter to draw
    private func l() -> [String:String] { ["A": "C", "B": "A", "C": "B"] }  // required letter to lose
    private func r() -> [String: Int] { ["X": 0, "Y": 3, "Z": 6] }  
    
    func day2part1() -> NSNumber {
        NSNumber(value: input.filter({!$0.isEmpty}).map({ line in
            let coms = line.split(separator: " ").map({$0.description})
            return (coms[1] == w()[coms[0]] ? 6 : coms[1] == d()[coms[0]] ? 3 : 0) + s()[coms[1]]!
        }).reduce(0, +))
    }
    
    func day2part2() -> NSNumber {
        NSNumber(value: input.filter({!$0.isEmpty}).map({ line in
            let coms = line.split(separator: " ").map({$0.description})
            return s(part2: true)[(coms[1] == "X" ? l()[coms[0]] : coms[1] == "Y" ? coms[0] : w(part2: true)[coms[0]])!]! + r()[coms[1]]!
        }).reduce(0, +))
    }
}
