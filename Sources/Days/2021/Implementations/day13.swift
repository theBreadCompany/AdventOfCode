//
//  day13.swift
//
//
//  Created by Fabio Mauersberger on 12.12.21.
//

import Foundation

extension Day {
    
    fileprivate struct Point: Hashable {
        var x: Int
        var y: Int
    }
    
    fileprivate func parse(rawData: [String]) -> ([Point], [Point]) {
        return rawData.reduce(into: ([Point](), [Point]())) { (result, element) in
            if element.contains("=") {
                result.1.append(Point(x: (element.contains("x") ? Int(String(element.split(separator: "=").last!))! : 0), y: (element.contains("y") ? Int(String(element.split(separator: "=").last!))! : 0)))
            } else {
                result.0.append(Point(x: Int(String(element.split(separator: ",").first!))!, y: Int(String(element.split(separator: ",").last!))!))            }
        }
    }
    
    fileprivate func fold(_ paper: [Point], at fold: Point) -> [Point] {
        var paper = paper
        Array(0...paper.count-1).forEach { pointIndex in
            if (fold.x != 0 ? paper[pointIndex].x : paper[pointIndex].y) > (fold.x != 0 ? fold.x : fold.y) {
                if fold.x != 0 {
                    paper[pointIndex].x = fold.x - (paper[pointIndex].x - fold.x)
                } else {
                    paper[pointIndex].y = fold.y - (paper[pointIndex].y - fold.y)
                }
            }
        }
        return Array(Set(paper))
    }
    
    func day13part1() -> Int {
        let (paper, folds) = parse(rawData: input)
        return fold(paper, at: folds.first!).count
    }
    
    func day13part2() -> Int {
        var (paper, folds) = parse(rawData: input)
        for foldingPoint in folds {
            paper = fold(paper, at: foldingPoint)
        }
        var table = Array(repeating: Array(repeating: ".", count: paper.map({$0.x}).max()!+1), count: paper.map({$0.x}).max()!+1)
        for point in paper {
            table[point.y][point.x] = "#"
        }
        for row in table[...5] {
            print(row)
        }
        print("Use terminal width of >=195 to see the letters.")
        return paper.count
    }
    
}
