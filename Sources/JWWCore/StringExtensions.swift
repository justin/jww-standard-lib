import Foundation

public extension String {
    /// A quoted representation of the string that is using the current `Locale` value.
    var localizedQuoted: String {
        quoted(with: Locale.current)
    }

    // A copy of the string wrapped in single quotes.
    var quoted: String {
        return "'" + self + "'"
    }

    /// A quoted representation of the string that is using the passed in locale.
    ///
    /// - Parameter locale: The Locale to use to determine the quotation delimeters.
    ///
    /// - Returns: A quoted representation of the string.
    func quoted(with locale: Locale?) -> String {
        guard let begin = locale?.quotationBeginDelimiter,
            let end = locale?.quotationEndDelimiter else {
            return self.quoted
        }

        return String(format: "%@%@%@", begin, self, end)
    }
}
