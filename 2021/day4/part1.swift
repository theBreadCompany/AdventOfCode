import Foundation

struct OrderedDictionary<K: Hashable, V>: ExpressibleByDictionaryLiteral {
    
    typealias Key = K
    typealias Value = V
    
    private var orderedKeys = [K]()
    private var dictionary = [K: V]()
    
    var count: Int { orderedKeys.count }
    
    init(dictionaryLiteral elements: (K, V)...) {
        for (key, val) in elements {
            self[key] = val
        }
    }
    
    subscript(key: K) -> V? {
        get { return dictionary[key] }
        set(newValue) {
            if orderedKeys.filter {$0 == key}.count == 0 {
                orderedKeys.append(key)
            }
            dictionary[key] = newValue
        }
    }
    
    var values: [V] {
        return orderedKeys.compactMap { dictionary[$0] }
    }
    
    var keys: [K] {
        return orderedKeys
    }
    
}

func part1(data: [String]) -> Int {
    
    func parseInput(rawData: [String]) -> ([Int], [[OrderedDictionary<Int, Bool>]]) {
        var _data = rawData
        let numbers = _data.first!.split(separator: ",").map{ Int($0.description)! }
        _data = rawData.filter { !$0.contains(",")}
        var tables = [[OrderedDictionary<Int, Bool>]]()
        var boardNr = -1
        var rowNr = -1
        for (i, val) in _data.map({Int($0.description)!}).enumerated() {
            if i % 25 == 0 {
                boardNr += 1
                rowNr = -1
                tables.append([])
            }
            if i % 5 == 0 {
                rowNr += 1
                tables[boardNr].append([:])
            }
            tables[boardNr][rowNr][val] = false
        }
        return (numbers, tables)
    }
    
    func calculateWinner(numbers: [Int], boards: [[OrderedDictionary<Int, Bool>]]) -> ([OrderedDictionary<Int, Bool>], Int) {
        var _boards = boards
        for number in numbers {
            for (iB, board) in boards.enumerated() {
                for (iR, row) in board.enumerated() {
                    if let _ = row[number] {
                        _boards[iB][iR][number] = true
                    }
                }
            }
            for board in _boards {
                var cols: [[Bool]] = Array(Array(repeating: [], count: 5))
                for (iR, row) in board.enumerated() {
                    cols[iR] = board.map { $0[Array($0.keys)[iR]]! }
                    if row.values.allSatisfy({ $0 == true }) {
                        return (board, number)
                    }
                }
                for col in cols {
                    if col.allSatisfy({ $0 == true }) {
                        return (board, number)
                    }
                }
            }
        }
        return ([[:]], 0)
    }
    
    func getScore(of truth: Bool, in table: [OrderedDictionary<Int, Bool>], wonAfter n: Int) -> Int {
        return table.flatMap { e in e.keys.filter { k in e[k] == truth } }.reduce(0, +)*n
    }
    
    let (numbers, tables) = parseInput(rawData: data)
    let (winnerboard, winningNumber) = calculateWinner(numbers: numbers, boards: tables)
    let sumOfFalse = getScore(of: false, in: winnerboard, wonAfter: winningNumber)
    return sumOfFalse
}

let input = CommandLine.arguments.filter { !$0.contains("swift") }
print(part1(data: input))


