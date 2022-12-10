//
//  day10.swift
//  
//
//  Created by Fabio Mauersberger on 10.12.22.
//

import Foundation

@objc
extension Y2022 {
    
    class CPU: NSObject {
        var part: Int = 1
        var xreg: Int = 1
        var observations = Array<Int>()
        var crt = Array<String>(repeating: "", count: 6)
        var cycle: Int = 0 {
            didSet {
                if part == 1 && ((cycle + 20) % 40) == 0 {
                    observations.append(xreg)
                }
            }
        }
        func cycle(_ n: UInt) {
            for _ in 0..<n {
                if part == 2 {
                    let pos = cycle % 40
                    crt[Int(floor(Double(cycle) / 40))]
                        .append(
                            (pos == xreg || pos == xreg+1 || pos == xreg-1)
                            ? "#" : ".")
                }
                cycle += 1
            }
        }
    }
    
    func process(instructions: [String], on cpu: CPU) {
        for i in 0..<instructions.filter({!$0.isEmpty}).count {
            let coms = instructions[i].components(separatedBy: " ")
            if coms.count == 2 {
                cpu.cycle(2)
                cpu.xreg += Int(coms[1])!
            } else {
                cpu.cycle(1)
            }
        }
    }
    
    func day10part1() -> NSNumber {
        let cpu = CPU()
        process(instructions: input, on: cpu)
        let strengthes = cpu.observations.enumerated().map({i, v in
            ((i+1)*40-20) * v
        })
        return NSNumber(value: strengthes.reduce(0, +))
    }
    
    func day10part2() -> NSString {
        let cpu = CPU()
        cpu.part = 2
        process(instructions: input, on: cpu)
        return cpu.crt.joined(separator: "\n") as NSString
    }
    
}
