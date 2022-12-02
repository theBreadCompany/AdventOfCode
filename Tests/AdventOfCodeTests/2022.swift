//
//  2022.swift
//  
//
//  Created by Fabio Mauersberger on 01.12.22.
//

import Foundation
import XCTest
import Days


fileprivate extension AdventOfCodeTests {
    
    var year: Int {
        2022
    }
    
    func testDay1() {
        let day = Day(1, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 72478)
        XCTAssertEqual(day.execute(part: 2) as! Int, 210367)
    }
    
    func testDay2() {
        let day = Day(2, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 12794)
        XCTAssertEqual(day.execute(part: 2) as! Int, 14979)
    }
    
}
