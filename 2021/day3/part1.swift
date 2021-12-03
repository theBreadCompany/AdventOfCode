let binNums = CommandLine.arguments.compactMap { $0.contains("0") ? $0 : nil }
var gammaBins = Array(repeating: false, count: binNums.first!.count)

for i in 0...binNums.first!.count-1 {
    var freqOfTrue = 0
    for val in binNums {
        if Array(val)[i].description == "1" {
            freqOfTrue += 1
        }
    }
    gammaBins[i] = freqOfTrue > binNums.count / 2 ? true : false
}
print(Int(gammaBins.map({$0 ? "1" : "0"}).joined(separator: ""), radix: 2)!*Int(gammaBins.map({!$0 ? "1" : "0"}).joined(separator: ""), radix: 2)!)

