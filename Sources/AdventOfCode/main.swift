import Days
import Darwin

func panic() {
    print("Need parameters in form of 'AdventOfCode [year] [day] [part]', i. e. 'AdventOfCode 2021 5 2'!")
    exit(1)
}

var year = 0
var day = 0
var part = 0

if CommandLine.arguments.count == 4 {
    if let y = Int(CommandLine.arguments[1]), 2020 < y && y < 2022 {
        year = y
    }
    if let d = Int(CommandLine.arguments[2]), 0 < d && d < 26 {
        day = d
    }
    if let p = Int(CommandLine.arguments[3]), 0 < p && p < 3 {
        part = p
    }
    if year == 0 || day == 0 || part == 0 {
        panic()
    }
} else {
    panic()
}

print("Running part \(part) of day \(day), year \(year)")
let puzzleDay = Day(day)
print(puzzleDay.execute(part: part))
