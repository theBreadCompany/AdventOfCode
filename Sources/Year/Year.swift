//
//  Year.swift
//  
//
//  Created by Fabio Mauersberger on 01.12.22.
//

import Foundation

@objc
public protocol Year: NSObjectProtocol {
    
    var input: [String] { get set }
    
    init()
    
    static func execute(_ day: NSNumber, part: NSNumber) -> AnyObject
    
    func readInput(for day: NSNumber)
    
}
