//
//  day10.swift
//  
//
//  Created by Fabio Mauersberger on 10.12.21.
//

import Foundation

extension Day {
    
    func day10part1() -> Int {
        //let correspondingEnd = ["(": ")", "[": "]", "{": "}", "<": ">"]
        let correspondingStart = [")": "(", "]": "[", "}": "{", ">": "<"]
        let data = input
        var corrupted = [String]()
        for line in data {
            var open = [String]()
            for character in line.toArray() {
                if correspondingStart.values.contains(character) {
                    open.append(character)
                } else {
                    if open.isEmpty || correspondingStart[character] != open.last ?? "" {
                        corrupted.append(character)
                        break
                    } else {
                        open = open.dropLast()
                    }
                }
            }
        }
        return corrupted.reduce(0, { (start, entry) in
            start + (entry == ")" ? 3 : (entry == "]" ? 57 : (entry == "}" ? 1197 : (entry == ">" ? 25137 : 0))))
        })
    }
    
    func day10part2() -> Int {
        let correspondingStart = [")": "(", "]": "[", "}": "{", ">": "<"]
        let correspondingEnd = ["(": ")", "[": "]", "{": "}", "<": ">"]
        let data = input
        var incomplete = [[String]]()
        for line in data {
            var open = [String]()
            for (i, character) in line.toArray().enumerated() {
                if correspondingStart.values.contains(character) {
                    open.append(character)
                } else {
                    if open.isEmpty {
                        incomplete.append(open)
                        break
                    } else if correspondingStart[character] != open.last ?? "" {
                        break
                    } else {
                        open = open.dropLast()
                    }
                }
                if i == line.count-1 {
                    incomplete.append(open)
                }
            }
        }
        var missing = [[String]]()
        for incomplete in incomplete {
            var fixed = [String]()
            for char in incomplete.reversed() {
                fixed.append(correspondingEnd[char]!)
            }
            missing.append(fixed)
        }
        var scores = [Int]()
        for missed in missing {
            var score = 0
            for char in missed {
                score = score * 5 + (char == ")" ? 1 : (char == "]" ? 2 : (char == "}" ? 3 : (char == ">" ? 4 : 0))))
            }
            scores.append(score)
        }
        return scores.sorted()[Int(Double(scores.count)/2-0.5)]
    }
}
