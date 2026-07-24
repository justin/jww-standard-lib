import Foundation
import Testing
@testable import JWWCore

/// Tests to validate the various extensions to `String`.
struct StringExtensionsTests {

    /// Validate we can properly quote a string value.
    @Test
    func testQuoted() {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "'\(value)'"

        let result = value.quoted

        #expect(result == expectedResult)
    }

    /// Validate we can properly quote a string value using the current `Locale` value.
    @Test
    func testLocalizedQuoted() {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "“\(value)”"

        let result = value.localizedQuoted

        #expect(result == expectedResult)
    }

    /// Validate we can properly quote a string value using an injected `Locale` value.
    @Test
    func testQuotedWithCustomLocale() {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "「\(value)」"

        let chinese = Locale.init(identifier: "zh-Hant")
        let result = value.quoted(with: chinese)

        #expect(result == expectedResult)
    }

    /// Validate we can properly quote a string value using `nil` as the injected `Locale` value.
    @Test
    func testQuotedWithNilLocale() {
        let value = "The quick brown fox jumped over the lazy dog"
        let expectedResult = "'\(value)'"

        let result = value.quoted(with: nil)

        #expect(result == expectedResult)
    }
}
