//
//  Y2021.swift
//  
//
//  Created by Fabio Mauersberger on 01.12.22.
//

import Foundation
import Year

public class Y2021: NSObject, Year {
    
    public var input: [String]
    
    required public override init() {
        input = []
    }
    
    public func readInput(for day: NSNumber) {
        do {
            self.input = try String(contentsOfFile: Bundle.module.path(forResource: "day\(day)", ofType: "txt")!)
                .split(separator: "\n")
                .map({String($0)})
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public static func execute(_ day: NSNumber, part: NSNumber) -> AnyObject {
        let s = Self.init()
        s.readInput(for: day)
        guard let unmanaged = s.perform(Selector("day\(day)part\(part)")) else {
            fatalError("Day \(day) and/or part \(part) not existing")
        }
        guard let _ = unmanaged.takeUnretainedValue() as? NSObject else {
            fatalError("Found unknown result for day \(day) part \(part)!")
        }
        return unmanaged.takeUnretainedValue()
    }
    
}
