import XCTest
import JWWCore

/// Tests to validate the various extensions to `Int`.
final class IntExtensionsTests: XCTestCase {
    /// Validate we can show a number as bytes.
    func testIntAsBytes() throws {
        let number = Int(128)

        let result = number.bytes

        XCTAssertEqual(result, number)
    }

    /// Validate we can show a number as kilobytes.
    func testIntAsKilobytes() throws {
        let expectedValue = 128_000
        let number = Int(128)

        let result = number.kilobytes

        XCTAssertEqual(result, expectedValue)
    }

    /// Validate we can show a number as megabytes.
    func testIntAsMegabytes() throws {
        let expectedValue = 128_000_000
        let number = Int(128)

        let result = number.megabytes

        XCTAssertEqual(result, expectedValue)
    }

    /// Validate we can show a number as gigabytes.
    func testIntAsGigabytes() throws {
        let expectedValue = 128_000_000_000
        let number = Int(128)

        let result = number.gigabytes

        XCTAssertEqual(result, expectedValue)
    }

    /// Validate we can show a number as terabytes.
    func testIntAsTerabytes() throws {
        let expectedValue = 128_000_000_000_000
        let number = Int(128)

        let result = number.terabytes

        XCTAssertEqual(result, expectedValue)
    }
}
