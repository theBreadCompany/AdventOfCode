import Foundation
var hPos = 0
var depth = 0

for (i, val) in CommandLine.arguments.enumerated() {
    if val.contains("forward") {
        hPos += Int(CommandLine.arguments[i+1].description)!
    }
    if val.contains("up") {
        depth -= Int(CommandLine.arguments[i+1].description)!
    }
    if val.contains("down") {
        depth += Int(CommandLine.arguments[i+1].description)!
    }
}
print(hPos*depth)
