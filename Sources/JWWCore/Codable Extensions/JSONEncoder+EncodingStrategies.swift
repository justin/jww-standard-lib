import Foundation

public extension JSONEncoder {
    /// Creates a new, reusable JSON encoder with a customizable date encoding strategy
    ///
    /// - Parameter dateEncodingStrategy: The date encoding strategy to use for the encoder.
    convenience init(dateEncodingStrategy: DateEncodingStrategy) {
        self.init()
        self.dateEncodingStrategy = dateEncodingStrategy
    }
}

public extension JSONEncoder.DateEncodingStrategy {
    /// Custom date encoding strategy that will attempt to decode a date formatted with ISO8601+millisecond precision.
    static let iso8601milliseconds = custom {
        var container = $1.singleValueContainer()
        try container.encode(DateFormatter.iso8601.string(from: $0))
    }
}
