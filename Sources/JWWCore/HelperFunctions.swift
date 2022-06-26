import Foundation

/// Function that throws out the passed in value and returns `Void`.
///
/// - Returns: The `Void` value: aka an empty tuple.
@inlinable
func void<T>() -> (T) -> Void {
    return const(())
}

/// Function that returns a function which returns a constant value.
///
/// - Parameter value: The value which will be returned.
/// - Returns: Closure that returns the passed value.
///
@inlinable
public func const<T, U>(_ value: T) -> (U) -> T {
    return { _ in value }
}

/// Function that returns the passed in parameter
///
/// - Parameter t: The parameter that will be returned.
@inlinable
public func id<T>(_ type: T) -> T {
    return type
}
