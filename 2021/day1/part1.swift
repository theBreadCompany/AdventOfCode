var numbers = CommandLine.arguments.compactMap { Int($0) }
var increased = 0
var oldNum = numbers.first!
for i in numbers {
    if Int(i)! > oldNum {
        increased += 1
    }
    oldNum = Int(i)!
}
print(increased)
