import Foundation
var hPos = 0
var depth = 0
var aim = 0

for (i, val) in CommandLine.arguments.enumerated() {
    if val.contains("forward") {
        hPos += Int(CommandLine.arguments[i+1].description)!
        depth += aim * Int(CommandLine.arguments[i+1].description)!
    }
    if val.contains("up") {
        aim -= Int(CommandLine.arguments[i+1].description)!
    }
    if val.contains("down") {
        aim += Int(CommandLine.arguments[i+1].description)!
    }
}
print(hPos*depth)
