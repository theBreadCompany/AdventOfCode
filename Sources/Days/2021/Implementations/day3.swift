//
//  File.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

@objc
extension Day {
    
    func year2021day3part1() -> NSNumber {
        let binNums = input.compactMap { $0.contains("0") ? $0 : nil }
        var gammaBins = Array(repeating: false, count: binNums.first!.count)

        for i in 0...binNums.first!.count-1 {
            var freqOfTrue = 0
            for val in binNums {
                if Array(val)[i].description == "1" {
                    freqOfTrue += 1
                }
            }
            gammaBins[i] = freqOfTrue > binNums.count / 2 ? true : false
        }
        return NSNumber(value: Int(gammaBins.map({$0 ? "1" : "0"}).joined(separator: ""), radix: 2)!*Int(gammaBins.map({!$0 ? "1" : "0"}).joined(separator: ""), radix: 2)!)
    }
    
    func year2021day3part2() -> NSNumber {
        let binNums = input.filter { $0.contains("0") }
        var oxygen = ""
        var carbondioxide = oxygen

        for run in 0...1 {
            var _binNums = binNums
            for i in 0..._binNums.first!.count-1 {
                if _binNums.count > 1 {
                    var count = 0
                    for val in _binNums {
                        count += (val[i] == "1") ? 1 : -1
                    }
                    if run == 0 {
                        _binNums = _binNums.filter { $0[i] == (count >= 0 ? "1" : "0") }
                        if _binNums.count == 1 { oxygen = _binNums.first! }
                    } else {
                        _binNums = _binNums.filter { $0[i] == (count < 0 ? "1" : "0") }
                        if _binNums.count == 1 { carbondioxide = _binNums.first! }
                    }
                }
            }
        }
        return NSNumber(value: Int(oxygen, radix: 2)!*Int(carbondioxide, radix: 2)!)
    }
}
