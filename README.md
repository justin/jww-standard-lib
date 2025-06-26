# JWW Standard Library

A set of protocols and types I use in all of my projects.

## Contents

* **Array+Extensions**: Adds a method to remove duplicate elements from arrays of hashable types.
* **DateFormatter+Extensions**: Provides a static ISO8601 date formatter with fractional seconds support.
* **FileManager+ContainerDirectories**: Convenience properties for accessing and creating app sandbox directories like Caches and Documents.
* **FormatStyle+Extensions**: Adds static ISO8601 format styles and parse strategies with fractional seconds for dates.
* **HelperFunctions**: Utility functions for discarding values and returning constants.
* **InfoPlistKey**: Type-safe access to Info.plist keys.
* **Int+Extensions**: Helpers for representing integers as bytes, kilobytes, megabytes, and gigabytes.
* **NotificationToken**: A wrapper for Notification observers that auto-removes on deinit.
* **OSLog+Extensions**: Simplifies creation of `Logger` and `OSLog` instances with custom subsystems and categories.
* **StringExtensions**: Adds quoting and locale-aware quoting utilities to `String`.
* **URL+StaticString**: Allows initialization of a `URL` from a `StaticString`.

### Codable Extensions

* **AnyCodingKey**: A reusable coding key for dynamic key scenarios.
* **AnyDecodable**: Type-erased wrapper for decoding values of unknown type.
* **Decoder+Context**: Protocol and helpers for attaching context to a decoder.
* **DecodingError+DebugDescription**: Adds detailed debug descriptions to decoding errors.
* **JSONDecoder+DecodingStrategies**: Custom date decoding strategies, including ISO8601 with fractional seconds.
* **JSONEncoder+EncodingStrategies**: Custom date encoding strategies, including ISO8601 with fractional seconds.
* **KeyedDecodingContainer+Extensions**: Helpers for decoding values by inferring types.

## Installation

### Using Swift Package Manager

Add the package to your dependencies in `Package.swift`:

```swift
.package(url: "https://github.com/justin/jww-standard-lib.git", from: "1.0.0")
```

Then add `JWWCore` to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "JWWCore", package: "jww-standard-lib")
    ]
)
```

Run `swift build` to fetch and build the package.

### Using Xcode

1. Go to **File > Add Packages...**
2. Enter the URL: `https://github.com/justin/jww-standard-lib.git`
3. Choose the version and add the `JWWCore` product to your target.

## License

Copyright 2025 Justin Williams. Licensed under the MIT license.
