extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct Fish: Hashable {
    var countdown: UInt8
    
    public mutating func produce() -> Fish? {
        if countdown == 0 {
            countdown = 6
            return Fish(countdown: 8)
        }
        countdown -= 1
        return nil
    }
}

let input = CommandLine.arguments[1...].first!
let data = input.split(separator: ",")

var fish = data.map({Fish(countdown: UInt8($0)!)})

for _ in 0..<80 {
    let fishCount = fish.count
    for i in 0..<fishCount {
        if let f = fish[i].produce() {
            fish.append(f)
        }
    }
}
print(fish.count)
