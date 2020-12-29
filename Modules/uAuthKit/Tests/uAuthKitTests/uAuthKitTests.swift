import XCTest
@testable import uAuthKit

final class uAuthKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(uAuthKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
