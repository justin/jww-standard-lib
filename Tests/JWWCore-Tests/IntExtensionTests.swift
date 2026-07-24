import Testing
import JWWCore

/// Tests to validate the various extensions to `Int`.
struct IntExtensionsTests {
    /// Validate we can show a number as bytes.
    @Test
    func testIntAsBytes() {
        let number = Int(128)

        let result = number.bytes

        #expect(result == number)
    }

    /// Validate we can show a number as kilobytes.
    @Test
    func testIntAsKilobytes() {
        let expectedValue = 128_000
        let number = Int(128)

        let result = number.kilobytes

        #expect(result == expectedValue)
    }

    /// Validate we can show a number as megabytes.
    @Test
    func testIntAsMegabytes() {
        let expectedValue = 128_000_000
        let number = Int(128)

        let result = number.megabytes

        #expect(result == expectedValue)
    }

    /// Validate we can show a number as gigabytes.
    @Test
    func testIntAsGigabytes() {
        let expectedValue = 128_000_000_000
        let number = Int(128)

        let result = number.gigabytes

        #expect(result == expectedValue)
    }

    /// Validate we can show a number as terabytes.
    @Test
    func testIntAsTerabytes() {
        let expectedValue = 128_000_000_000_000
        let number = Int(128)

        let result = number.terabytes

        #expect(result == expectedValue)
    }
}
