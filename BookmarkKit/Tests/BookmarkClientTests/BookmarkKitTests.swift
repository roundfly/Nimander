import XCTest
@testable import BookmarkKit

final class BookmarkKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BookmarkKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
