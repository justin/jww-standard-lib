import Foundation

public extension Array where Element: Hashable {
    /// Creates a new Array with only the unique values.
    func removingDuplicates() -> [Element] {
        return Array(Set(self))
    }
}
