//
//  File.swift
//  
//
//  Created by Fabio Mauersberger on 09.12.22.
//

import Foundation
import CoreGraphics

@objc class Point: NSObject {
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var x: Int
    var y: Int
    
    override var description: String {
        "Point(x: \(x), y: \(y))"
    }
    
    // assuming that the hasher implementation for NSObject is, well, not what is required here
    override var hash: Int {
        try! JSONEncoder().encode(CGPoint(x: x, y: y)).hashValue
    }
}
