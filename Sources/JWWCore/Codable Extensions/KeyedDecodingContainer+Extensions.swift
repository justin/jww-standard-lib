import Foundation

public extension KeyedDecodingContainer {
    /// Decodes a value of the given type for the given key by inferring the data type.
    ///
    /// - Parameters:
    ///   - key: The key that the decoded value is associated with.
    ///   - type: The type of value to decode.
    /// - Returns: A value of the requested type, if present for the given key and convertible to the requested type.
    func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
        try self.decode(T.self, forKey: key)
    }

    /// Decodes a value of the given type for the given key, if present, by inferring the data type.

    /// - Parameter key: The key that the decoded value is associated with.
    /// - Returns: A decoded value of the requested type, or nil if the Decoder does not
    ///            have an entry associated with the given key, or if the value is a null value.
    func decodeIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T? {
        try decodeIfPresent(T.self, forKey: key)
    }
}
