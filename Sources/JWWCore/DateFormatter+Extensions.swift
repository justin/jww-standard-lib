import Foundation

extension DateFormatter {
    /// ISO8601 date formatter with support for internet date times and fractional seconds.
    public static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
}
