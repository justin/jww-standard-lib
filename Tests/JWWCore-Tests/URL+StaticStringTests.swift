import Foundation
import Testing
@testable import JWWCore

struct URLStaticStringTests {
    /// Validate we can generate a URL from a `StaticString`
    @Test
    func testInitFromStaticString() {
        let expectedURL = URL(string: "https://carpeaqua.com")!
        let result = URL(staticString: "https://carpeaqua.com")

        #expect(result == expectedURL)
    }
}
