import XCTest
@testable import uMapKit

final class uMapKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(uMapKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
