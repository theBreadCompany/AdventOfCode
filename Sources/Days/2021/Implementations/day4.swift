//
//  day4.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

struct OrderedDictionary<K: Hashable, V>: ExpressibleByDictionaryLiteral {
    
    typealias Key = K
    typealias Value = V
    
    private var orderedKeys = [K]()
    private var dictionary = [K: V]()
    
    var count: Int { orderedKeys.count }
    
    init(dictionaryLiteral elements: (K, V)...) {
        elements.forEach { (key, val) in self[key] = val }
    }
    
    subscript(key: K) -> V? {
        get { return dictionary[key] }
        set(newValue) {
            if !orderedKeys.contains(key) { orderedKeys.append(key) }
            dictionary[key] = newValue
        }
    }
    
    var values: [V] {
        return orderedKeys.compactMap { dictionary[$0] }
    }
    
    var keys: [K] {
        return orderedKeys
    }
    
}

fileprivate func parseInput(rawData: [String]) -> ([Int], [[OrderedDictionary<Int, Bool>]]) {
    var _data = rawData
    let numbers = _data.first!.split(separator: ",").map{ Int($0.description)! }
    _data = rawData.filter { !$0.contains(",")}
    var tables = [[OrderedDictionary<Int, Bool>]]()
    var boardNr = -1
    for (i, val) in _data.enumerated() {
        if i % 5 == 0 {
            boardNr += 1
            tables.append([])
        }
        tables[boardNr].append([:])
        tables[boardNr][i%5] = val.split(separator: " ").reduce(into: OrderedDictionary<Int, Bool>()) { $0[Int($1)!] = false }
    }
    return (numbers, tables)
}

@objc
extension Day {
    
    func year2021day4part1() -> NSNumber {
        
        func calculateWinner(numbers: [Int], boards: [[OrderedDictionary<Int, Bool>]]) -> ([OrderedDictionary<Int, Bool>], Int) {
            var _boards = boards
            for number in numbers {
                for (iB, board) in boards.enumerated() {
                    for (iR, row) in board.enumerated() {
                        if let _ = row[number] {
                            _boards[iB][iR][number] = true
                        }
                    }
                }
                for board in _boards {
                    var cols: [[Bool]] = Array(Array(repeating: [], count: 5))
                    for (iR, row) in board.enumerated() {
                        cols[iR] = board.map { $0[Array($0.keys)[iR]]! }
                        if row.values.allSatisfy({ $0 == true }) {
                            return (board, number)
                        }
                    }
                    for col in cols {
                        if col.allSatisfy({ $0 == true }) {
                            return (board, number)
                        }
                    }
                }
            }
            return ([[:]], 0)
        }
        
        func getScore(of truth: Bool, in table: [OrderedDictionary<Int, Bool>], wonAfter n: Int) -> Int {
            return table.flatMap { e in e.keys.filter { k in e[k] == truth } }.reduce(0, +)*n
        }
        
        let (numbers, tables) = parseInput(rawData: input)
        let (winnerboard, winningNumber) = calculateWinner(numbers: numbers, boards: tables)
        let sumOfFalse = getScore(of: false, in: winnerboard, wonAfter: winningNumber)
        return NSNumber(value: sumOfFalse)
    }
    

    func year2021day4part2() -> NSNumber {
        
        func calculateLooser(numbers: [Int], boards: [[OrderedDictionary<Int, Bool>]]) -> ([OrderedDictionary<Int, Bool>], Int) {
            var _boards = boards
            for number in numbers {
                for (iB, board) in _boards.enumerated() {
                    for (iR, row) in board.enumerated() {
                        if let _ = row[number] {
                            _boards[iB][iR][number] = true
                        }
                    }
                }
                var index = 0
                var arrayCount = _boards.count
                while index < arrayCount-1 {
                    let board = _boards[index]
                    var cols: [[Bool]] = Array(Array(repeating: [], count: 5))
                    var toDelete = false
                    for (iR, row) in board.enumerated() {
                        cols[iR] = board.map { $0[Array($0.keys)[iR]]! }
                        toDelete = row.values.allSatisfy({ $0 == true }) ? true : toDelete
                    }
                    cols.forEach { col in toDelete = col.allSatisfy({ $0 == true }) ? true : toDelete }
                    if toDelete {
                        _boards.remove(at: index)
                        index = 0
                        arrayCount = _boards.count
                        if arrayCount == 1 {
                            return (board, number)
                        }
                    } else {
                        index += 1
                    }
                }
            }
            return ([[:]], 0)
        }
        
        func getScore(of truth: Bool, in table: [OrderedDictionary<Int, Bool>], wonAfter n: Int) -> Int {
            return table.flatMap { e in e.keys.filter { k in e[k] == truth } }.reduce(0, +)*n
        }
        
        let (numbers, tables) = parseInput(rawData: input)
        let (winnerboard, winningNumber) = calculateLooser(numbers: numbers, boards: tables)
        let sumOfFalse = getScore(of: false, in: winnerboard, wonAfter: winningNumber)
        return NSNumber(value: sumOfFalse)
    }

}
