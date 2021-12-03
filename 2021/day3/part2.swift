var binNums = CommandLine.arguments.compactMap { $0.contains("0") ? $0 : nil }

var oxigen = binNums
var carbondioxide = binNums

var i = 0
while oxigen.count > 1 {
    if getCommon(from: oxigen, in: i) >= 0 {
        oxigen = oxigen.filter { $0[i] == "1" }
    } else {
        oxigen = oxigen.filter { $0[i] == "0" }
    }
    i += 1
}

i = 0
while carbondioxide.count > 1 {
    if getCommon(from: carbondioxide, in: i) < 0 {
        carbondioxide = carbondioxide.filter { $0[i] == "1" }
    } else {
        carbondioxide = carbondioxide.filter { $0[i] == "0" }
    }
    i += 1
}

print(Int(oxigen.first!, radix: 2)!*Int(carbondioxide.first!, radix: 2)!)

func getCommon(from data: [String], in col: Int) -> Int {
    var count = 0
    data.forEach { count += ($0[col] == "1") ? 1 : -1 }
    return count
}

extension String {
    subscript(pos: Int) -> String {
        return Array(self)[pos].description
    }
}
