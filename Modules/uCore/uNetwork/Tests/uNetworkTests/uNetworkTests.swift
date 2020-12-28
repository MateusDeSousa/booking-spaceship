import XCTest
@testable import uNetwork

final class uNetworkTests: XCTestCase {
    
    static var allTests = [
        ("GetAvailableCar", testGetAvailableCar)
    ]
    
    func testGetAvailableCar() {
        let api = APIRepository()
        let expactation = XCTestExpectation(description: "Get available cars")
        
        api.getAvailableCars { result in
            switch result {
            case .success(let data):
                XCTAssertFalse(data.isEmpty)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            expactation.fulfill()
        }
        
        wait(for: [expactation], timeout: 60)
    }
}
