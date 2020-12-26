import XCTest
@testable import uCore

final class uCoreTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(uCore().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
