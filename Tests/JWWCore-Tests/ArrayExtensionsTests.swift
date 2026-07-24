import Testing
@testable import JWWCore

struct ArrayExtensionsTests {
    /// Validate we can remove duplicates from a hashable array.
    @Test
    func testRemovingDuplicates() {
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

        #expect(result.count == 6)
        #expect(result != array)
    }
}
