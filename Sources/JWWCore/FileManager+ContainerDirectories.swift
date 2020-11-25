import Foundation

public extension FileManager {
    /// The URL to the app sandbox's Caches directory.
    ///
    /// If the directory does not presently exist, this will create it.
    var cachesDirectory: URL {
        guard let result = try? url(for: .cachesDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: true) else {
            fatalError("Could not create and return the Caches directory.")
        }

        return result
    }

    /// The URL to the app sandbox's Documents directory.
    ///
    /// If the directory does not presently exist, this will create it.
    var documentsDirectory: URL {
        guard let result = try? url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: true) else {
            fatalError("Could not create and return the Documents directory.")
        }

        return result
    }

    /// The URL to the app sandbox's Library directory.
    ///
    /// If the directory does not presently exist, this will create it.
    var libraryDirectory: URL {
        guard let result = try? url(for: .libraryDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: true) else {
            fatalError("Could not create and return the Library directory.")
        }

        return result
    }

    /// The URL to the app's shared container.
    ///
    /// - Parameter identifier: The group identifier for the app group.
    func sharedContainerURL(forSecurityApplicationGroupIdentifier identifier: String) -> URL {
        guard let result = containerURL(forSecurityApplicationGroupIdentifier: identifier) else {
            fatalError("Could not return the shared container URL for \(identifier).")
        }

        return result
    }
}
