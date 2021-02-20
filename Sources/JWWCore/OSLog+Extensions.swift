import Foundation
import os

@available(OSX 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public extension Logger {
    /// Initialize a new `Logger` instance.
    ///
    /// - Parameter subsystem: The preferred logging subsystem.
    /// - Parameter category: The preferred logging category.
    init(subsystem: LoggingProvider.Subsystem = .default, category: LoggingProvider.Category = .default) {
        self.init(subsystem: subsystem, category: category.rawValue)
    }
}

public extension OSLog {
    /// Initialize a new `OSLog` instance using the parent application bundle identifier and a custom category.
    ///
    /// - Parameter subsystem: The preferred logging subsystem.
    /// - Parameter category: The preferred logging category.
    convenience init(subsystem: LoggingProvider.Subsystem = .default, category: LoggingProvider.Category = .default) {
        self.init(subsystem: subsystem, category: category.rawValue)
    }
}

/// A logging provider returns information about the subsystems and categories available for generating `OSLog` instances.
public struct LoggingProvider {
    /// Typealias to String for defining the subsystem.
    public typealias Subsystem = String

    /// Value type that declares a category that can be used for logging to the Console.
    public struct Category: Hashable, Equatable, RawRepresentable {
        // swiftlint:disable:next nesting
        public typealias RawValue = String
        public let rawValue: RawValue
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }
    }

    /// Generate a new `OSLog` instance for a given subsystem and category.
    ///
    /// - Parameters:
    ///   - subsystem: The `Subsystem` you want to log to.
    ///   - category: The `Category` you want to log to.
    /// - Returns: The log object itself.
    public static func makeLog(subsystem: Subsystem = .default, category: Category = .default) -> OSLog {
        return OSLog(subsystem: subsystem, category: category)
    }
}

// MARK: Default Subsystem
// ====================================
// Default Subsystem
// ====================================
public extension LoggingProvider.Subsystem {
    /// The default subsystem provider, which is mapped to the parent application's bundle identifier.
    static var `default` = Bundle.main.bundleIdentifier ?? ""
}

// MARK: Default Categories
// ====================================
// Default Categories
// ====================================
public extension LoggingProvider.Category {
    /// Convenience accessor for the `.none` category.
    static let `default`: LoggingProvider.Category = .none

    /// A category for any background usage logging
    static let background = LoggingProvider.Category(rawValue: "background")

    /// A category for any data persistence logging
    static let database = LoggingProvider.Category(rawValue: "database")

    /// A category for any network / API logging
    static let networking = LoggingProvider.Category(rawValue: "networking")

    /// An empty string category.
    static let none = LoggingProvider.Category(rawValue: "")

    /// A category for any test-related logging
    static let testing = LoggingProvider.Category(rawValue: "testing")

    // swiftlint:disable identifier_name
    /// A category for any UI-related logging
    static let ui = LoggingProvider.Category(rawValue: "ui")
    // swiftlint:enable identifier_name
}
