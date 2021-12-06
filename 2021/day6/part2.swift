let input = CommandLine.arguments[1...].first!
let data = input.split(separator: ",")

var fish: [Int: Int] = [0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0]
data.forEach { fish[Int($0)!] = fish[Int($0)!]! + 1 }

for _ in 0..<256 {
    var carry = 0
    for k in 0...8 {
        if k == 0 {
            carry = fish[k]!
            fish[k] = fish[k+1]
        } else if k == 8 {
            fish[k-1] = fish[k]!
            fish[6] = fish[6]! + carry
            fish[k] = carry
        } else {
            fish[k-1] = fish[k]!
            fish[k] = fish[k+1]
        }
    }
}
print(fish.values.reduce(0, +))
