//
//  2022.swift
//  
//
//  Created by Fabio Mauersberger on 01.12.22.
//

import Foundation
import XCTest
import Days


final class i2022Tests: XCTestCase {
    
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
        XCTAssertEqual(day.execute(part: 2) as! Int, 870)
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
    
    func testDay8() {
        let day = Day(8, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 1818)
        XCTAssertEqual(day.execute(part: 2) as! Int, 368368)
    }
    
    func testDay9() {
        let day = Day(9, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 6236)
        XCTAssertEqual(day.execute(part: 2) as! Int, 2449)
    }
    
    func testDay10() {
        let day = Day(9, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 17940)
        XCTAssertEqual(day.execute(part: 2) as! String,
                       """
                       ####..##..###...##....##.####...##.####.
                       ...#.#..#.#..#.#..#....#.#.......#....#.
                       ..#..#....###..#..#....#.###.....#...#..
                       .#...#....#..#.####....#.#.......#..#...
                       #....#..#.#..#.#..#.#..#.#....#..#.#....
                       ####..##..###..#..#..##..#.....##..####.
                       """)
    }
    
    func testDay11() {
        let day = Day(11, inYear: year)
        XCTAssertEqual(day.execute(part: 1) as! Int, 51075)
        XCTAssertEqual(day.execute(part: 2) as! Int, 11741456163)
    }
}
