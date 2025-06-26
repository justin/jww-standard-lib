import Foundation
import Testing
import JWWCore

/// Tests to validate the various extensions to `FormatStyle` for ISO8601 with fractional seconds.
struct FormatStyleExtensionTests {
    @Suite
    struct FormatStyleISO8601withFractionalSecondsTests {
        @Test func testISO8601withFractionalSecondsFormatStyle() {
            let style = Date.ISO8601FormatStyle.iso8601withFractionalSeconds
            let date = Date(timeIntervalSince1970: 0)
            let formatted = date.formatted(style)
            #expect(formatted.contains(".000Z"), "Expected fractional seconds in formatted string: \(formatted)")
        }

        @Test func testFormatStyleFormatsFractionalSeconds() {
            let date = Date(timeIntervalSince1970: 0)
            let formatted = date.formatted(.iso8601withFractionalSeconds)
            #expect(formatted.contains(".000Z"), "Expected fractional seconds in formatted string: \(formatted)")
        }
    }

    @Suite
    struct ParseStrategyISO8601withFractionalSecondsTests {
        @Test func testParseStrategyParsesFractionalSeconds() throws {
            let legacyFormatter = ISO8601DateFormatter()
            legacyFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

            let dateString = "2025-06-26T12:34:56.789Z"
            let parsed = try Date(dateString, strategy: .iso8601withFractionalSeconds)
            let expected = try #require(legacyFormatter.date(from: dateString))
            #expect(parsed.timeIntervalSince1970 == expected.timeIntervalSince1970)
        }
    }

    @Suite
    struct DateISO8601withFractionalSecondsTests {
        @Test func testDateInitWithISO8601FractionalSeconds() throws {
            let legacyFormatter = ISO8601DateFormatter()
            legacyFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

            let dateString = "2025-06-26T12:34:56.789Z"
            let date = try Date(iso8601withFractionalSeconds: dateString)
            let expected = legacyFormatter.date(from: dateString)
            #expect(date.timeIntervalSince1970 == expected?.timeIntervalSince1970)
        }

        @Test func testDatePropertyISO8601withFractionalSeconds() {
            let date = Date(timeIntervalSince1970: 0)
            let formatted = date.iso8601withFractionalSeconds
            #expect(formatted.contains(".000Z"), "Expected fractional seconds in formatted string: \(formatted)")
        }
    }

    @Suite
    struct StringISO8601withFractionalSecondsTests {
        @Test func testStringParsesToDateWithFractionalSeconds() throws {
            let legacyFormatter = ISO8601DateFormatter()
            legacyFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

            let dateString = "2025-06-26T12:34:56.789Z"
            let date = try dateString.iso8601withFractionalSeconds()
            let expected = legacyFormatter.date(from: dateString)
            #expect(date.timeIntervalSince1970 == expected?.timeIntervalSince1970)
        }

        @Test func testStringThrowsOnInvalidDate() {
            let invalid = "not-a-date"
            #expect(throws: (any Error).self) { try invalid.iso8601withFractionalSeconds() }
        }
    }
}
