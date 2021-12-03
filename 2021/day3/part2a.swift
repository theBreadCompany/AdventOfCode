var binNums = CommandLine.arguments.filter { $0.contains("0") }
var oxygen = ""
var carbondioxide = oxygen

for run in 0...1 {
    var _binNums = binNums
    for i in 0..._binNums.first!.count-1 {
        if _binNums.count > 1 {
            var count = 0
            for val in _binNums {
                count += (val[i] == "1") ? 1 : -1
            }
            if run == 0 {
                _binNums = _binNums.filter { $0[i] == (count >= 0 ? "1" : "0") }
                if _binNums.count == 1 { oxygen = _binNums.first! }
            } else {
                _binNums = _binNums.filter { $0[i] == (count < 0 ? "1" : "0") }
                if _binNums.count == 1 { carbondioxide = _binNums.first! }
            }
        }
    }
}
print(Int(oxygen, radix: 2)!*Int(carbondioxide, radix: 2)!)

extension String {
    subscript(pos: Int) -> String {
        return Array(self)[pos].description
    }
}
