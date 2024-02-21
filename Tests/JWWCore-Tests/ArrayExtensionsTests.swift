import XCTest

final class ArrayExtensionsTests: XCTestCase {
    /// Validate we can remove duplicates from a hashable array.
    func testRemovingDuplicates() async throws {
        let array = [
            1,
            2,
            3,
            4,
            5,
            6,
            5,
            4,
            3,
            2,
            1
        ]

        let result = array.removingDuplicates()

        XCTAssertEqual(result.count, 6)
        XCTAssertNotEqual(result, array)
    }
}
