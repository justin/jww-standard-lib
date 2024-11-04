import Foundation

/**
 Value type to safely fetch key values from the the Info.plist file.

 If you are planning to add a new key to the Info.plist for the application and then reference it in code,
 the preferred way is to add a new static constant on the `InfoPlistKeys` extension with the name of the key.

 - SeeAlso: `InfoPlistKey.configuration`
 */
@frozen
public struct InfoPlistKey: Hashable, Sendable, RawRepresentable {
    public let rawValue: RawValue
    public typealias RawValue = String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension InfoPlistKey {
    /// Key to access the build number of the currently running target.
    static let bundleVersion = InfoPlistKey("CFBundleVersion")

    /// Key to access the marketing version of the currently running target.
    static let bundleVersionShort = InfoPlistKey("CFBundleShortVersionString")

    /// Key to access the bundle identifier of the currently running target.
    static let bundleIdentifier = InfoPlistKey("CFBundleIdentifier")
}

public extension Bundle {
    /// Returns the value associated with the specified key in the receiver's information property list.
    ///
    /// - Parameter key: A key in the receiver's property list.
    func object(forInfoDictionaryKey key: InfoPlistKey) -> Any? {
        return object(forInfoDictionaryKey: key.rawValue)
    }
}

/// Property wrapper that encapsulates a value that can be retrieved from an app's Info.plist.
@propertyWrapper
public struct InfoPlistValue<T> {
    /// The key to retrieve a value for.
    public let key: InfoPlistKey

    /// The default value to return if the key is not set.
    public let defaultValue: T

    /// The bundle to retrieve the values from.
    public let bundle: Bundle

    /// Create and return a new plist value.
    /// - Parameters:
    ///   - key: The plist key to retrieve a value for.
    ///   - defaultValue: The default value to return if the key is not set.
    ///   - targetBundle: The bundle to retrieve the values from.
    public init(key: InfoPlistKey, defaultValue: T, bundle: Bundle = Bundle.main) {
        self.key = key
        self.defaultValue = defaultValue
        self.bundle = bundle
    }

    public var wrappedValue: T {
        bundle.object(forInfoDictionaryKey: key.rawValue) as? T ?? defaultValue
    }
}

extension InfoPlistValue: Sendable where T: Sendable {

}
