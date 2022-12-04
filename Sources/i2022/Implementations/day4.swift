//
//  day4.swift
//  
//
//  Created by Fabio Mauersberger on 04.12.22.
//
//  probably a bad implementation, but I like the syntax lmao

import Foundation

@objc
extension Y2022 {
    
    func day4part1() -> NSNumber {
        NSNumber(value: input.filter({!$0.isEmpty}).map({ line in
            let ranges = line.components(separatedBy: ",").map({$0.components(separatedBy: "-").compactMap({Int($0)})})
            return (
                (ranges[0][0] <= ranges[1][0] && ranges[0][1] >= ranges[1][1]) ||
                (ranges[1][0] <= ranges[0][0] && ranges[1][1] >= ranges[0][1]) ?
                1 : 0
            )
        }).reduce(0, +))
    }
    
    func day4part2() -> NSNumber {
        NSNumber(value: input.filter({!$0.isEmpty}).map({ line in
            let ranges = line.components(separatedBy: ",").map({$0.components(separatedBy: "-").compactMap({Int($0)})})
            return (
                (ranges[0][0] >= ranges[1][0] && ranges[0][0] <= ranges[1][1]) ||
                (ranges[1][0] >= ranges[0][0] && ranges[1][1] <= ranges[0][1]) ||
                (ranges[0][1] >= ranges[1][0] && ranges[0][1] <= ranges[1][1]) ||
                (ranges[1][1] >= ranges[0][0] && ranges[1][1] <= ranges[0][1]) ?
                1 : 0
            )
        }).reduce(0, +))
    }
}
