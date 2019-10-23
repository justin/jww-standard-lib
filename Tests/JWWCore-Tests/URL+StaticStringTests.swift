import XCTest
import Foundation
@testable import JWWCore

final class URLStaticStringTests: XCTestCase {
    /// Validate we can generate a URL from a `StaticString`
    func testInitFromStaticString() {
        let expectedURL = URL(string: "https://carpeaqua.com")!
        let result = URL(staticString: "https://carpeaqua.com")

        XCTAssertEqual(result, expectedURL)
    }
}
