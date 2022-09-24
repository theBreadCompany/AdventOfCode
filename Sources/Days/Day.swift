//
//  Day.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation

@objc
public class Day: NSObject {
    
    let value: Int
    let year: Int
    var input: [String]
    
    public init(_ v: Int, inYear year: Int) {
        self.value = v
        self.year = year
        self.input = []
    }
    
    public func execute(part: Int) -> CustomStringConvertible {
        self.readInput()
        guard let unmanaged = self.perform(Selector("year\(year)day\(value)part\(part)")) else {
            fatalError("Day \(value) and/or part \(part) not existing")
        }
        if let value = unmanaged.takeUnretainedValue() as? NSNumber {
            return Int(truncating: value)
        } else if let value = unmanaged.takeUnretainedValue() as? NSString {
            return String(value)
        } else {
            fatalError("Found unknown result for day \(value) part \(part)!")
        }
    }
    
    private func readInput(){
        do {
            self.input = try String(contentsOfFile: Bundle.module.path(forResource: "day\(value)", ofType: "txt")!)
            .split(separator: "\n")
            .map({String($0)})
        } catch {
            print(error.localizedDescription)
        }
    }
}
