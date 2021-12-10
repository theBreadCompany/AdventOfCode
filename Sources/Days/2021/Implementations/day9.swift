//
//  day9.swift
//
//
//  Created by Fabio Mauersberger on 09.12.21.
//

import CoreGraphics

extension Day {
    
    fileprivate struct Point: Hashable {
        
        let x: Int
        let y: Int
        
        func adjacent() -> [Point] {
            return [Point(x: x+1, y: y), Point(x: x-1, y: y), Point(x: x, y: y+1), Point(x: x, y: y-1)]
        }
    }
    
    fileprivate func lows(in data: [String]) -> [Point: Int] {
        var lows = [Point: Int]()
        for (i, d) in data.enumerated() {
            for (j, n) in d.enumerated() {
                let _n = Int(String(n))!
                if i == 0 && j == 0 {
                    if data[i+1].toArray()[j].toInt() > _n && data[i].toArray()[j+1].toInt() > _n {
                        lows.updateValue(_n, forKey: Point(x: j, y: i))
                    }
                } else if i == 0 {
                    if j == d.count-1 {
                        if data[i+1].toArray()[j].toInt() > _n && data[i].toArray()[j-1].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    } else {
                        if data[i+1].toArray()[j].toInt() > _n && data[i].toArray()[j+1].toInt() > _n && data[i].toArray()[j-1].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    }
                } else if j == 0 {
                    if i == data.count-1 {
                        if data[i].toArray()[j+1].toInt() > _n && data[i-1].toArray()[j].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    } else {
                        if data[i+1].toArray()[j].toInt() > _n && data[i].toArray()[j+1].toInt() > _n && data[i-1].toArray()[j].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    }
                } else {
                    if j == d.count-1 && i == data.count-1 {
                        if data[i-1].toArray()[j].toInt() > _n && data[i].toArray()[j-1].toInt()  > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    } else if j == d.count-1 {
                        if data[i-1].toArray()[j].toInt() > _n && data[i].toArray()[j-1].toInt() > _n && data[i+1].toArray()[j].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    } else if i == data.count-1 {
                        if data[i-1].toArray()[j].toInt() > _n && data[i].toArray()[j-1].toInt() > _n && data[i].toArray()[j+1].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    } else {
                        if data[i+1].toArray()[j].toInt() > _n && data[i].toArray()[j+1].toInt() > _n && data[i].toArray()[j-1].toInt() > _n && data[i-1].toArray()[j].toInt() > _n {
                            lows.updateValue(_n, forKey: Point(x: j, y: i))
                        }
                    }
                }
            }
        }
        
        return lows
    }
    
    func day9part1() -> Int {
        let data = input
        let lows = lows(in: data)
        
        return lows.values.map({$0+1}).reduce(0, +)
    }
    
    func day9part2() -> Int {
        
        let data = input
        let lows = lows(in: data)
        var sizes = [Int]()
        var dataGrid = [Point: String]()
        
        for (y, row) in data.enumerated() {
            for (x, val) in row.enumerated() {
                dataGrid.updateValue(val.description, forKey: Point(x: x, y: y))
            }
        }
        
        for low in lows.keys {
            var size = 0
            var checked = [Point]()
            var adjacents = [low]
            while adjacents.count > 0 {
                var newAdjacents = [Point]()
                for adjacent in adjacents {
                    size += 1
                    checked.append(adjacent)
                    newAdjacents.append(contentsOf: adjacent.adjacent().filter({
                        !checked.contains($0) && !newAdjacents.contains($0) &&
                        dataGrid[$0, default: "9"] != "9"
                    }))
                }
                adjacents = newAdjacents
            }
            sizes.append(size)
        }
        
        return sizes.sorted().reversed()[0..<3].reduce(1, *)
    }
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
