//
//  day11.swift
//  
//
//  Created by Fabio Mauersberger on 11.12.21.
//

import Foundation


extension Y2021 {
    
    fileprivate struct Octopus: Hashable, Equatable {
        let pos: Point
        var powerLevel: Int
    }
    
    fileprivate func parse(_ input: [String]) -> [Octopus] {
        var dataGrid = [Octopus]()
        for (y, line) in input.enumerated() {
            for (x, val) in line.enumerated() {
                dataGrid.append(Octopus(pos: Point(x: x, y: y), powerLevel: Int(String(val))!))
            }
        }
        return dataGrid
    }
    
    fileprivate func load(grid: [Octopus]) -> (Int, [Octopus]) {
        var dataGrid = grid
        var flashed = Set(dataGrid.filter({$0.powerLevel >= 9}).map({$0.pos}))
        Array(0...dataGrid.count-1).forEach({dataGrid[$0].powerLevel += 1})
        var new = Set(flashed)
        while !new.isEmpty {
            var next = Set<Point>()
            for flashing in new {
                for adjacent in flashing.adjacent() {
                    if let index = dataGrid.firstIndex(where: {$0.pos == adjacent}) {
                        dataGrid[index].powerLevel += 1
                        if dataGrid[index].powerLevel > 9 && !flashed.contains(dataGrid[index].pos) {
                            next.insert(dataGrid[index].pos)
                            flashed.insert(dataGrid[index].pos)
                        }
                    }
                }
            }
            new = next
        }
        flashed.forEach({ point in dataGrid[dataGrid.firstIndex(where: {$0.pos == point})!].powerLevel = 0})
        
        return (flashed.count, dataGrid)
    }
    
    @objc
    func day11part1() -> NSNumber {
         
        var dataGrid = parse(input)
        var flashes = 0
        for _ in 0..<100 {
            let newValues = load(grid: dataGrid)
            flashes += newValues.0
            dataGrid = newValues.1
        }
        return NSNumber(value: flashes)
    }
    
    @objc
    func day11part2() -> NSNumber {
        var dataGrid = parse(input)
        var steps = 0
        while !dataGrid.allSatisfy({$0.powerLevel == 0}) {
            dataGrid = load(grid: dataGrid).1
            steps += 1
        }
        return NSNumber(value: steps)
    }
}

fileprivate extension Point {
    func adjacent() -> [Point] {
        return [Point(x: x+1, y: y), Point(x: x-1, y: y), Point(x: x, y: y+1), Point(x: x, y: y-1),
                Point(x: x+1, y: y+1), Point(x: x-1, y: y+1), Point(x: x+1, y: y-1), Point(x: x-1, y: y-1)]
    }
}
