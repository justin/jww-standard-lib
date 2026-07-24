import Foundation
import Testing
@testable import JWWCore

/// Tests to validate the helper functions.
struct HelperFunctionTests {
    private struct Item: Identifiable {
        let id = UUID()
    }

    /// Tests to validate the `const` function.
    @Test
    func testConstMapping() {
        let inital = Array(repeating: 10, count: 100)
        let expected = Array(repeating: true, count: 100)
        let result = inital.map(const(true))
        #expect(result == expected)
    }

    /// Validate we can map to void using our void function.
    @Test
    func testVoidMapping() {
        let array: [String] = [ "Foo", "Bar", "Biz" ]

        let result: [Void] = array.map(void())

        for item in result {
            #expect(item == ())
        }
    }

    /// Tests to validate the `id` function.
    @Test
    func testIDMapping() {
        #expect(id(()) == ())

        let inital = Array(repeating: 10, count: 100)
        let result = inital.map(id)
        #expect(inital == result)
    }
}
