import Foundation

public extension Int {
    /// Convenience helper to show a number as 'bytes.'
    var bytes: Int {
        self
    }

    /// Convenience helper to calculate and show a number as 'kilobytes.'
    var kilobytes: Int {
        self * 1000
    }

    /// Convenience helper to calculate and show a number as 'megabytes.'
    var megabytes: Int {
        kilobytes * 1000
    }

    /// Convenience helper to calculate and show a number as 'gigabytes.'
    var gigabytes: Int {
        megabytes * 1000
    }

    /// Convenience helper to calculate and show a number as 'terabytes.'
    var terabytes: Int {
        gigabytes * 1000
    }
}
