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
    @available(*, renamed: "iso8601WithFractionalSeconds")
    /// Custom date decoding strategy that will attempt to decode a date formatted with ISO8601 fractional second precision.
    static let iso8601milliseconds = iso8601WithFractionalSeconds

    /// Custom date encoding strategy that will attempt to decode a date formatted with ISO8601 fractional second precision.
    static let iso8601WithFractionalSeconds = custom {
        var container = $1.singleValueContainer()
#if swift(>=6.0)
        try container.encode($0.iso8601withFractionalSeconds)
#else
        try container.encode(DateFormatters.iso8601.string(from: $0))
#endif
    }
}
