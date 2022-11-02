import Foundation

extension DecodingError: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .typeMismatch(_, let context):
            return "Type mismatch. \(context.debugDescription) key path: \(context.keyPath)"
        case .valueNotFound(_, let context):
            return "Value not found at '\(context.keyPath)'. \(context.debugDescription)"
        case .keyNotFound(let key, let context) where context.keyPath.isEmpty:
            return "Key not found: '\(key.keyPath)'."
        case .keyNotFound(let key, let context):
            return "Key not found: '\(key.keyPath)' expected at path: \(context.keyPath)"
        case .dataCorrupted(let context):
            let underlyingDescription = (context.underlyingError as NSError?)?.userInfo["NSDebugDescription"] ?? ""
            return "Data corrupted. \(context.debugDescription) \(underlyingDescription)"
        @unknown default:
            return "Unknown DecodingError type returned: \(localizedDescription)"
        }
    }
}

public extension DecodingError.Context {
    /// Convenience accessor to join together each coding key included in a decoding error's `context.codingPath` array.
    var keyPath: String {
        return codingPath.map { $0.keyPath }.joined(separator: ".")
    }
}

public extension CodingKey {
    /// Convenience accessor to convert a coding key's name into a string. If the key is an integer,
    /// wrap it as a `String`. Otherwise, we return the existing `stringValue`.
    var keyPath: String {
        return intValue.flatMap(String.init) ?? stringValue
    }
}
