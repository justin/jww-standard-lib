import XCTest
import JWWCore

/// Tests to validate our `AnyDecodable` type.
final class AnyDecodableTests: XCTestCase {
    private let decoder = JSONDecoder()

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

    private var sut: [String: AnyDecodable]!

    override func setUpWithError() throws {
        try super.setUpWithError()

        let data = try XCTUnwrap(fixture.data(using: .utf8))
        sut = try decoder.decode([String: AnyDecodable].self, from: data)
    }

    /// Validate we can decode a `Bool` value.
    func testDecodingBoolean() throws {
        XCTAssertEqual(sut["boolean"], AnyDecodable(true))
    }

    /// Validate we can decode numeric values.
    func testDecodingNumericValues() throws {
        XCTAssertEqual(sut["integer"], AnyDecodable(100))
        XCTAssertEqual(sut["double"], AnyDecodable(3.141592653589793))
    }

    /// Validate we can decode `String` values.
    func testDecodingString() throws {
        XCTAssertEqual(sut["string"], AnyDecodable("John Appleseed"))
    }

    /// Validate we can decode null values.
    func testDecodingNull() throws {
        XCTAssertEqual(sut["null"], AnyDecodable(NSNull()))
    }

    /// Validate we can decode an array of `AnyDecodable` values.
    func testDecodingArray() throws {
        let expectedArray: [String] = ["Steve", "Tim", "Phil"]

        let result = try XCTUnwrap(sut["array"]?.base as? [String])

        XCTAssertEqual(result, expectedArray)
    }
}
