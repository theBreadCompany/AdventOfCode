//
//  day9.swift
//  
//
//  Created by Fabio Mauersberger on 09.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    func day9part1() -> NSNumber {
        var visited = Set<[Int]>()
        let h = Point(x: 0, y: 0)
        let t = Point(x: 0, y: 0)
        for line in input.filter({!$0.isEmpty}) {
            let coms = line.components(separatedBy: " ")
            for _ in 0..<Int(coms[1])! {
                if coms[0] == "L" { h.x -= 1 } else
                if coms[0] == "R" { h.x += 1 } else
                if coms[0] == "D" { h.y -= 1 } else
                if coms[0] == "U" { h.y += 1 }
                
                let dx = t.x - h.x
                let dy = t.y - h.y
                if dx*dx.signum() == 2 && dy*dy.signum() == 0 { t.x += 1*(-dx.signum()) } else
                if dy*dy.signum() == 2 && dx*dx.signum() == 0 { t.y += 1*(-dy.signum()) } else
                if dx*dx.signum() == 2 && dy*dy.signum() == 1
                || dy*dy.signum() == 2 && dx*dx.signum() == 1
                { t.x += 1*(-dx.signum()); t.y += 1*(-dy.signum()) }
                visited.insert([t.x, t.y])
            }
        }
        return NSNumber(value: visited.count)
    }
    
    
    func day9part2() -> NSNumber {
        var visited = Set<[Int]>()
        var knots = Array<Point>()
        Array(0..<10).forEach({_ in knots.append(Point(x: 0, y: 0))}) // the Array(repeating:count:) initializer fails as Swift objects are "synced", meaning every index basically contains the same object
        for line in input.filter({!$0.isEmpty}) {
            let coms = line.components(separatedBy: " ")
            for _ in 0..<Int(coms[1])! {
                if coms[0] == "L" { knots[0].x -= 1 } else
                if coms[0] == "R" { knots[0].x += 1 } else
                if coms[0] == "D" { knots[0].y -= 1 } else
                if coms[0] == "U" { knots[0].y += 1 }
                
                for i in 1..<knots.count {
                    
                    let dx = knots[i].x - knots[i-1].x
                    let dy = knots[i].y - knots[i-1].y
                    if dx*dx.signum() == 2 && dy*dy.signum() == 0 { knots[i].x += 1*(-dx.signum()) } else
                    if dy*dy.signum() == 2 && dx*dx.signum() == 0 { knots[i].y += 1*(-dy.signum()) } else
                    if dx*dx.signum() == 2 && dy*dy.signum() >= 1
                        || dy*dy.signum() == 2 && dx*dx.signum() >= 1
                    { knots[i].x += 1*(-dx.signum()); knots[i].y += 1*(-dy.signum()) }
                    
                    print(line, knots, i, dx, dy)
                }
                visited.insert([knots.last!.x, knots.last!.y])
            }
        }
        return NSNumber(value: visited.count)
    }
}
