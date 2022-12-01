//
//  Day.swift
//  
//
//  Created by Fabio Mauersberger on 06.12.21.
//

import Foundation
import Year
import i2021
import i2022

@objc
public class Day: NSObject {
    
    let value: Int
    let year: Int
    public var input: [String]
    
    public init(_ v: Int, inYear year: Int) {
        self.value = v
        self.year = year
        self.input = []
    }
    
    public func execute(part: Int) -> CustomStringConvertible {
        guard let yearClass = NSClassFromString("i" + year.description + ".Y" + year.description) as? Year.Type else {
            fatalError("Year '\(year)' not existing!")
        }
        
        let r = yearClass.execute(NSNumber(value: value), part: NSNumber(value: part))
        if let r = r as? NSNumber {
            return r.intValue
        } else if let r = r as? NSString {
            return r as String
        } else {
            fatalError("Unknown error while handling result through NSValue proxies")
        }
        
    }
}
