import Foundation

/// Extension to provide a static ISO8601 format style with fractional seconds.
public extension Date.ISO8601FormatStyle {
    /// A static ISO8601 format style that includes fractional seconds.
    static let iso8601withFractionalSeconds: Self = .init(includingFractionalSeconds: true)
}

/// Extension to provide a parse strategy for ISO8601 dates with fractional seconds.
public extension ParseStrategy where Self == Date.ISO8601FormatStyle {
    /// A static parse strategy for ISO8601 dates with fractional seconds.
    static var iso8601withFractionalSeconds: Date.ISO8601FormatStyle { .iso8601withFractionalSeconds }
}

/// Extension to provide a format style for ISO8601 dates with fractional seconds.
public extension FormatStyle where Self == Date.ISO8601FormatStyle {
    /// A static format style for ISO8601 dates with fractional seconds.
    static var iso8601withFractionalSeconds: Date.ISO8601FormatStyle { .iso8601withFractionalSeconds }
}

/// Extension to add ISO8601 with fractional seconds parsing and formatting to `Date`.
public extension Date {
    /// Initializes a `Date` from a string using the ISO8601 format with fractional seconds.
    /// - Parameter parseInput: The string input to parse.
    /// - Throws: An error if the string cannot be parsed as a date.
    init(iso8601withFractionalSeconds parseInput: ParseStrategy.ParseInput) throws {
        try self.init(parseInput, strategy: .iso8601withFractionalSeconds)
    }

    /// Returns the date formatted as an ISO8601 string with fractional seconds.
    var iso8601withFractionalSeconds: String {
        formatted(.iso8601withFractionalSeconds)
    }
}

/// Extension to add ISO8601 with fractional seconds parsing to `String`.
public extension String {
    /// Parses the string as a `Date` using the ISO8601 format with fractional seconds.
    /// - Returns: A `Date` if parsing succeeds.
    /// - Throws: An error if the string cannot be parsed as a date.
    func iso8601withFractionalSeconds() throws -> Date {
        try .init(iso8601withFractionalSeconds: self)
    }
}
