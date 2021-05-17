    import XCTest
    @testable import MPath

    final class MPathTests: XCTestCase {
        func testExample() {
            XCTAssertEqual(Path("/tmp").exists, true)
            XCTAssertEqual(Path.current.exists, true)
        }
    }
