import XCTest
import Days


final class AdventOfCodeTests: XCTestCase {
    
    func testDay1() {
        let day = Day(1)
        XCTAssertEqual(day.execute(part: 1), 1400)
        XCTAssertEqual(day.execute(part: 2), 1429)
    }
    
    func testDay2() {
        let day = Day(2)
        XCTAssertEqual(day.execute(part: 1), 1938402)
        XCTAssertEqual(day.execute(part: 2), 1947878632)
    }
    
    func testDay3() {
        let day = Day(3)
        XCTAssertEqual(day.execute(part: 1), 3985686)
        XCTAssertEqual(day.execute(part: 2), 2555739)
    }
    
    func testDay4() {
        let day = Day(4)
        XCTAssertEqual(day.execute(part: 1), 27027)
        XCTAssertEqual(day.execute(part: 2), 36975)
    }
    
    func testDay5() {
        let day = Day(5)
        XCTAssertEqual(day.execute(part: 1), 7380)
        XCTAssertEqual(day.execute(part: 2), 21373)
    }
    
    func testDay6() {
        let day = Day(6)
        XCTAssertEqual(day.execute(part: 1), 360761)
        XCTAssertEqual(day.execute(part: 2), 1632779838045)
    }
}