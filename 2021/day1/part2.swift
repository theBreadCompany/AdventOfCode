let numbers = CommandLine.arguments.compactMap { Int($0) }
var increased = 0
var oldNum = numbers[i] + numbers[i+1] + numbers[i+2]
for i in 0...numbers.count-1 {
    if i + 2 < numbers.count {
        if numbers[i] + numbers[i+1] + numbers[i+2] > oldNum {
            increased += 1
        }
        oldNum = numbers[i] + numbers[i+1] + numbers[i+2]
    }
}
print(increased)
