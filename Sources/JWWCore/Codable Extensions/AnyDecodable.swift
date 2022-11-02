import Foundation

///  A type-erased `Decodable` value.
@frozen public struct AnyDecodable: Decodable, Equatable {
    /// The value wrapped by this instance.
    public let base: Any

    /// Creates a type-erased `Decodable` value that wraps the given instance.
    public init<T>(_ base: T?) {
        self.base = base ?? ()
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let string = try? container.decode(String.self) {
            self.init(string)
        } else if let bool = try? container.decode(Bool.self) {
            self.init(bool)
        } else if let int = try? container.decode(Int.self) {
            self.init(int)
        } else if let uint = try? container.decode(UInt.self) {
            self.init(uint)
        } else if let double = try? container.decode(Double.self) {
            self.init(double)
        } else if let array = try? container.decode([AnyDecodable].self) {
            self.init(array.map(\.base))
        } else if let dictionary = try? container.decode([String: AnyDecodable].self) {
            self.init(dictionary.mapValues(\.base))
        } else if container.decodeNil() {
            self.init(NSNull())
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode AnyDecodable value")
        }
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs.base, rhs.base) {
        case let (lhs as String, rhs as String):
            return lhs == rhs
        case let (lhs as Bool, rhs as Bool):
            return lhs == rhs
        case let (lhs as Int, rhs as Int):
            return lhs == rhs
        case let (lhs as UInt, rhs as UInt):
            return lhs == rhs
        case let (lhs as Double, rhs as Double):
            return lhs == rhs
        case let (lhs as [AnyDecodable], rhs as [AnyDecodable]):
            return lhs == rhs
        case let (lhs as [String: AnyDecodable], rhs as [String: AnyDecodable]):
            return lhs == rhs
        case is (NSNull, NSNull), is (Void, Void):
            return true
        default:
            return false
        }
    }
}
