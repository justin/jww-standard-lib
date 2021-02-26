import XCTest
@testable import JWWCore

/// Tests to validate the helper functions.
final class HelperFunctionTests: XCTestCase {
    private struct Item: Identifiable {
        let id = UUID()
    }

    /// Tests to validate the `const` function.
    func testConstMapping() throws {
        XCTAssertTrue(const(())() == ())
        let value = Int.random(in: 0...100)

        let result = const(value)()

        XCTAssertEqual(result, value)
    }

    /// Validate we can map to void using our void function.
    func testVoidMapping() throws {
        let array: [String] = [ "Foo", "Bar", "Biz" ]

        let result: [Void] = array.map(void)

        for item in result {
            XCTAssertTrue(item == ())
        }
    }

    /// Tests to validate the `id` function.
    func testIDMapping() {
        XCTAssertTrue(id(()) == ())

        let oneValue = Int.random(in: 0...100)
        XCTAssertEqual(id(oneValue), oneValue)

        let twoValues = ("Foo", "Bar")
        XCTAssertTrue(id(twoValues) == twoValues)

        let threeValues = ("Foo", Bool.random(), "Biz")
        XCTAssertTrue(id(threeValues) == threeValues)
    }
}
