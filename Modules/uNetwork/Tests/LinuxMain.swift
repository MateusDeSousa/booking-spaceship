import XCTest

import uNetworkTests

var tests = [XCTestCaseEntry]()
tests += uNetworkTests.allTests()
XCTMain(tests)
