//
//  File.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

@objc
extension Day {
    
    func year2021day6part1() -> NSNumber {
        struct Fish: Hashable {
            var countdown: UInt8
            
            public mutating func produce() -> Fish? {
                if countdown == 0 {
                    countdown = 6
                    return Fish(countdown: 8)
                }
                countdown -= 1
                return nil
            }
        }

        let input = input.first!
        let data = input.split(separator: ",")

        var fish = data.map({Fish(countdown: UInt8($0)!)})

        for _ in 0..<80 {
            let fishCount = fish.count
            for i in 0..<fishCount {
                if let f = fish[i].produce() {
                    fish.append(f)
                }
            }
        }
        return NSNumber(value: fish.count)

    }
    
    func year2021day6part2() -> NSNumber {
        let input = input.first!
        let data = input.split(separator: ",")

        var fish: [Int: Int] = [0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0]
        data.forEach { fish[Int($0)!] = fish[Int($0)!]! + 1 }

        for _ in 0..<256 {
            var carry = 0
            for k in 0...8 {
                if k == 0 {
                    carry = fish[k]!
                    fish[k] = fish[k+1]
                } else if k == 8 {
                    fish[k-1] = fish[k]!
                    fish[6] = fish[6]! + carry
                    fish[k] = carry
                } else {
                    fish[k-1] = fish[k]!
                    fish[k] = fish[k+1]
                }
            }
        }
        return NSNumber(value: fish.values.reduce(0, +))

    }
}
