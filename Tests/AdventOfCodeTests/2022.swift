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
    
    func testDay3() {
        let day = Day(3, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 7763)
        XCTAssertEqual(day.execute(part: 2) as! Int, 2569)
    }
    
    func testDay4() {
        let day = Day(4, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 509)
        XCTAssertEqual(day.execute(part: 2) as! Int, 570)
    }
    
    func testDay5() {
        let day = Day(5, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! String, "TGWSMRBPN")
        XCTAssertEqual(day.execute(part: 2) as! String, "TZLTLWRNF")
    }
    
    func testDay6() {
        let day = Day(6, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 1480)
        XCTAssertEqual(day.execute(part: 2) as! Int, 2746)
    }
    
    func testDay7() {
        let day = Day(7, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 1886043)
        XCTAssertEqual(day.execute(part: 2) as! Int, 3842121)
    }
}
