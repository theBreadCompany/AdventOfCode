//
//  day8.swift
//  
//
//  Created by Fabio Mauersberger on 08.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    func day8part1() -> NSNumber {
        let forest = input.filter({!$0.isEmpty}).map({$0.compactMap({Int($0.description)})})
        var vtrees: Set<Point> = Set()
        for row in 0..<forest.count {
            for col in 0..<forest[0].count-1 { // ignore the last column
                if Array(0..<col).allSatisfy({forest[row][$0] < forest[row][col]}) //visible from the left
                    || Array(col+1..<forest[row].count).allSatisfy({forest[row][$0] < forest[row][col]}) //visible from the left
                    || Array(0..<row).allSatisfy({forest[$0][col] < forest[row][col]})
                    || Array(row+1..<forest.count).allSatisfy({forest[$0][col] < forest[row][col]})
                { vtrees.insert(Point(x: col, y: row)) }
            }
        }
        return NSNumber(value: vtrees.count + forest.count) // add the ignored last column
    }
    
    func day8part2() -> NSNumber {
        let forest = input.filter({!$0.isEmpty}).map({$0.compactMap({Int($0.description)})})
        var maxsscore = 0
        for row in 1..<forest.count-1 {
            for col in 1..<forest[0].count-1 {
                var scores = Array(repeating: 0, count: 4)
                //look up
                for nrow in 1...row {
                    scores[0] += 1
                    if forest[row-nrow][col] >= forest[row][col] {
                        break
                    }
                }
                //look down
                for nrow in row+1..<forest.count {
                    scores[1] += 1
                    if forest[nrow][col] >= forest[row][col] {
                        break
                    }
                }
                //look left
                for ncol in 1...col {
                    scores[2] += 1
                    if forest[row][col-ncol] >= forest[row][col] {
                        break
                    }
                }
                //look right
                for ncol in col+1..<forest[row].count {
                    scores[3] += 1
                    if forest[row][ncol] >= forest[row][col] {
                        break
                    }
                }
                let sscore = scores.reduce(1, *)
                maxsscore = maxsscore < sscore ? sscore : maxsscore
            }
        }
        return NSNumber(value: maxsscore)
    }
    
}

@objc class Point: NSObject {
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var x: Int
    var y: Int
}
