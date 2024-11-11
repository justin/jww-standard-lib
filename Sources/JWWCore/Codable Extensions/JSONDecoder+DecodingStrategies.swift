import Foundation

public extension JSONDecoder {
    /// Creates a new, reusable JSON decoder with a customizable date decoding strategy and decoding context.
    ///
    /// - Parameter dateDecodingStrategy: The date decoding strategy to use for the decoder.
    /// - Parameter context: Custom payload that can be used as part of the JSON decoding.
    convenience init(dateDecodingStrategy: DateDecodingStrategy, context: DecodingContext? = nil) {
        self.init()
        self.dateDecodingStrategy = dateDecodingStrategy
        self.context = context
    }
}

public extension JSONDecoder.DateDecodingStrategy {
    /// Custom date decoding strategy that will attempt to decode a date formatted with ISO8601+millisecond precision.
    static let iso8601milliseconds = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = DateFormatters.iso8601.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Could not parse date string in current format: \(string)")
    }
}
