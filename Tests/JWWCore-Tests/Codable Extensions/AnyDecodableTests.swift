import Foundation
import Testing
import JWWCore

/// Tests to validate our `AnyDecodable` type.
struct AnyDecodableTests {
    private let fixture = """
    {
        "string": "John Appleseed",
        "boolean": true,
        "integer": 100,
        "double": 3.141592653589793,
        "array": ["Steve", "Tim", "Phil"],
        "nested": {
            "a": "foo",
            "b": "bar",
            "c": "biz"
        },
        "null": null
    }
    """

    /// Validate we can decode a `Bool` value.
    @Test
    func testDecodingBoolean() throws {
        let sut = try decodedFixture()

        #expect(sut["boolean"] == AnyDecodable(true))
    }

    /// Validate we can decode numeric values.
    @Test
    func testDecodingNumericValues() throws {
        let sut = try decodedFixture()

        #expect(sut["integer"] == AnyDecodable(100))
        #expect(sut["double"] == AnyDecodable(3.141592653589793))
    }

    /// Validate we can decode `String` values.
    @Test
    func testDecodingString() throws {
        let sut = try decodedFixture()

        #expect(sut["string"] == AnyDecodable("John Appleseed"))
    }

    /// Validate we can decode null values.
    @Test
    func testDecodingNull() throws {
        let sut = try decodedFixture()

        #expect(sut["null"] == AnyDecodable(NSNull()))
    }

    /// Validate we can decode an array of `AnyDecodable` values.
    @Test
    func testDecodingArray() throws {
        let expectedArray: [String] = ["Steve", "Tim", "Phil"]
        let sut = try decodedFixture()

        let result = try #require(sut["array"]?.base as? [String])

        #expect(result == expectedArray)
    }

    private func decodedFixture() throws -> [String: AnyDecodable] {
        let data = try #require(fixture.data(using: .utf8))
        return try JSONDecoder().decode([String: AnyDecodable].self, from: data)
    }
}
