//
//  File.swift
//  
//
//  Created by Fabio Mauersberger on 24.09.22.
//

import Foundation
import XCTest
import Days

final class i2021Tests: XCTestCase {
    
    var year: Int {
        2021
    }
    
    func testDay1() {
        let day = Day(1, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 1400)
        XCTAssertEqual(day.execute(part: 2) as! Int, 1429)
    }
    
    func testDay2() {
        let day = Day(2, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 1938402)
        XCTAssertEqual(day.execute(part: 2) as! Int, 1947878632)
    }
    
    func testDay3() {
        let day = Day(3, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 3985686)
        XCTAssertEqual(day.execute(part: 2) as! Int, 2555739)
    }
    
    func testDay4() {
        let day = Day(4, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 27027)
        XCTAssertEqual(day.execute(part: 2) as! Int, 36975)
    }
    
    func testDay5() {
        let day = Day(5, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 7380)
        XCTAssertEqual(day.execute(part: 2) as! Int, 21373)
    }
    
    func testDay6() {
        let day = Day(6, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 360761)
        XCTAssertEqual(day.execute(part: 2) as! Int, 1632779838045)
    }
    
    func testDay7() {
        let day = Day(7, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 336721)
        XCTAssertEqual(day.execute(part: 2) as! Int, 91638945)
    }
    
    func testDay8() {
        let day = Day(8, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 352)
        XCTAssertEqual(day.execute(part: 2) as! Int, 936117)
    }
    
    func testDay9() {
        let day = Day(9, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 456)
        XCTAssertEqual(day.execute(part: 2) as! Int, 1047744)
    }
    
    func testDay10() {
        let day = Day(10, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 344193)
        XCTAssertEqual(day.execute(part: 2) as! Int, 3241238967)
    }
    
    func testDay11() {
        let day = Day(11, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 1627)
        XCTAssertEqual(day.execute(part: 2) as! Int, 329)
    }
    
    func testDay12() {
        let day = Day(12, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 4691)
        XCTAssertEqual(day.execute(part: 2) as! Int, 140718)
    }
    
    func testDay13() {
        let day = Day(13, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 653)
        XCTAssertEqual(day.execute(part: 2) as! String,
        "#    #  # ###  #### ###  ###  ###  #  #\n" +
        "#    # #  #  # #    #  # #  # #  # # # \n" +
        "#    ##   #  # ###  ###  #  # #  # ##  \n" +
        "#    # #  ###  #    #  # ###  ###  # # \n" +
        "#    # #  # #  #    #  # #    # #  # # \n" +
        "#### #  # #  # #### ###  #    #  # #  #")
    }
    
    func testDay14() {
        let day = Day(14, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 2590)
        XCTAssertEqual(day.execute(part: 2) as! Int, 2875665202438)
    }
}
