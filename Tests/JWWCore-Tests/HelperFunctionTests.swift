import XCTest
@testable import JWWCore

/// Tests to validate the helper functions.
final class HelperFunctionTests: XCTestCase {
    private struct Item: Identifiable {
        let id = UUID()
    }

    /// Tests to validate the `const` function.
    func testConstMapping() throws {
        let inital = Array(repeating: 10, count: 100)
        let expected = Array(repeating: true, count: 100)
        let result = inital.map(const(true))
        XCTAssertTrue(result == expected)
    }

    /// Validate we can map to void using our void function.
    func testVoidMapping() throws {
        let array: [String] = [ "Foo", "Bar", "Biz" ]

        let result: [Void] = array.map(void())

        for item in result {
            XCTAssertTrue(item == ())
        }
    }

    /// Tests to validate the `id` function.
    func testIDMapping() {
        XCTAssertTrue(id(()) == ())

        let inital = Array(repeating: 10, count: 100)
        let result = inital.map(id)
        XCTAssertTrue(inital == result)
    }
}
