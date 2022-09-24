//
//  Day.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

public class Day: NSObject {
    
    let value: Int
    var input: [String]
    
    public init(_ v: Int) {
        self.value = v
        self.input = []
    }
    
    public func execute(part: Int) -> CustomStringConvertible {
        self.readInput()
        switch value {
        case 1:
            return part == 1 ? self.day1part1() : self.day1part2()
        case 2:
            return part == 1 ? self.day2part1() : self.day2part2()
        case 3:
            return part == 1 ? self.day3part1() : self.day3part2()
        case 4:
            return part == 1 ? self.day4part1() : self.day4part2()
        case 5:
            return part == 1 ? self.day5part1() : self.day5part2()
        case 6:
            return part == 1 ? self.day6part1() : self.day6part2()
        case 7:
            return part == 1 ? self.day7part1() : self.day7part2()
        case 8:
            return part == 1 ? self.day8part1() : self.day8part2()
        case 9:
            return part == 1 ? self.day9part1() : self.day9part2()
        case 10:
            return part == 1 ? self.day10part1() : self.day10part2()
        case 11:
            return part == 1 ? self.day11part1() : self.day11part2()
        case 12:
            return part == 1 ? self.day12part1() : self.day12part2()
        case 13:
            return part == 1 ? self.day13part1() : self.day13part2()
        case 14:
            return part == 1 ? self.day14part1() : self.day14part2()
        case 15:
            return part == 1 ? self.day15part1() : self.day15part2()
        case 16:
            return part == 1 ? self.day16part1() : self.day16part2()
        default:
            fatalError("Day \(value) and/or part \(part) not existing")
        }
    }
    
    private func readInput(){
        do {
            self.input = try String(contentsOfFile: Bundle.module.path(forResource: "day\(value)", ofType: "txt")!)
            .split(separator: "\n")
            .map({String($0)})
        } catch {
            print(error.localizedDescription)
        }
    }
}
