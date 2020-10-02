import XCTest
@testable import UIModule

final class UIModuleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(UIModule().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
