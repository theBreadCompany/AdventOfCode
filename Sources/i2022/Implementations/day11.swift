//
//  day11.swift
//  
//
//  Created by Fabio Mauersberger on 11.12.22.
//

import Foundation
import Int2X

@objc
extension Y2022 {
    
    class Monkey: NSObject {
        var items: [Int]
        var operation: (Int) -> Int
        var targets: [Int]
        var inspections: Int = 0
        var divisor: Int
        init(items: [Int], operation: @escaping (Int) -> Int, targets: [Int], divisor: Int) {
            self.items = items
            self.operation = operation
            self.targets = targets
            self.divisor = divisor
        }
        
        override var description: String {
            "(<Monkey> items: \(items), inspections: \(inspections))"
        }
    }
    
    func process(_ input: [String]) -> [Monkey] {
        var monkeys = Array<Monkey>()
        let input = input.filter({!$0.isEmpty})
        for mIdx in 0...(input.count+1)/7 {
            let lineIdx = mIdx * 6
            let items: [Int] = input[lineIdx+1].components(separatedBy: CharacterSet(charactersIn: ":, "))[4...].compactMap({Int($0)})
            let _op = input[lineIdx+2].components(separatedBy: " ")
            let (op, factor) = (_op[_op.count-2], _op.last!)
            let operations: (Int) -> Int = { wl in
                if op == "*" {
                    return wl * (Int(factor) == nil ? wl : Int(factor)!)
                } else {
                    return wl + (Int(factor) == nil ? wl : Int(factor)!)
                }
            }
            let _t = input[lineIdx+3].components(separatedBy: " ")
            let (t, f) = (Int(input[lineIdx+4].components(separatedBy: " ").last!)!, Int(input[lineIdx+5].components(separatedBy: " ").last!)!)
            monkeys.append(Monkey(items: items, operation: operations, targets: [t, f], divisor: Int(_t.last!)!))
        }
        return monkeys
    }
    
    func play(for rounds: Int, _ monkeys: [Monkey], hardmode: Bool = false){
        let combinedDivs = monkeys.map({$0.divisor}).reduce(1, *) // https://github.com/gereons/AoC2022/blob/main/Sources/Day11/Day11.swift smart move, really need to learn math...
        for _ in 0..<rounds {
            for monkey in monkeys {
                monkey.inspections += monkey.items.count
                for _ in 0..<monkey.items.count {
                    monkey.items[0] = (hardmode ? monkey.operation(monkey.items[0]) : Int(floor(Double(monkey.operation(monkey.items[0]) / 3)))) % combinedDivs // ref as above
                    monkeys[monkey.targets[monkey.items[0].isMultiple(of: monkey.divisor) ? 0 : 1]].items.append(monkey.items[0])
                    monkey.items = Array(monkey.items.dropFirst())
                }
            }
        }
    }
    
    func day11part1() -> NSNumber {
        let monkeys = process(input)
        play(for: 20, monkeys)

        return NSNumber(value: monkeys.map({$0.inspections}).sorted()[6...].reduce(1, *))
    }
    
    func day11part2() -> NSNumber {
        let monkeys = process(input)
        play(for: 10000, monkeys, hardmode: true)
        
        return NSNumber(value: monkeys.map({$0.inspections}).sorted()[6...].reduce(1, *))
    }
}
