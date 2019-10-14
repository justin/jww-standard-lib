import Foundation
import os.log

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

    /// The available categories provided by the logging provider.
    public enum Category: String {
        case none = "default"
        case background
        case database
        case networking
        case testing
        case ui

        /// Convenience accessor for the `.none` category.
        public static var `default` = Category.none
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
