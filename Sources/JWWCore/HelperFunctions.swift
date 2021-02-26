import Foundation

/// Function that throws out the passed in value and returns `Void`.
///
/// - Parameter transform: The parameter that will be thrown away.
/// - Returns: The `Void` value: aka an empty tuple.
@inlinable
func void<T>(_ transform: T) -> Void {
    return ()
}

/// Function that returns a function which returns a constant value.
///
/// - Parameter value: The value which will be returned.
/// - Returns: Closure that returns the passed value.
///
@inlinable
public func const<T>(_ value: T) -> () -> T {
    return { value }
}

/// Function that returns the passed in parameter as a tuple.
///
/// - Parameter transform: The parameter that will be returned in a tuple.
@inlinable
public func id<T>(_ transform: T) -> (T) {
    return (transform)
}
