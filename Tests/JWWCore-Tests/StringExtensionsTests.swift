import XCTest
@testable import JWWCore

/// Tests to validate the various extensions to `String`.
final class StringExtensionsTests: XCTestCase {

    /// Validate we can properly quote a string value.
    func testQuoted() throws {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "'\(value)'"

        let result = value.quoted

        XCTAssertEqual(result, expectedResult)
    }

    /// Validate we can properly quote a string value using the current `Locale` value.
    func testLocalizedQuoted() throws {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "“\(value)”"

        let result = value.localizedQuoted

        XCTAssertEqual(result, expectedResult)
    }

    /// Validate we can properly quote a string value using an injected `Locale` value.
    func testQuotedWithCustomLocale() throws {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "「\(value)」"

        let chinese = Locale.init(identifier: "zh-Hant")
        let result = value.quoted(with: chinese)

        XCTAssertEqual(result, expectedResult)
    }

    /// Validate we can properly quote a string value using `nil` as the injected `Locale` value.
    func testQuotedWithNilLocale() throws {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "'\(value)'"

        let result = value.quoted(with: nil)

        XCTAssertEqual(result, expectedResult)
    }
}
