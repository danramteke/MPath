import Foundation
import XCTest
import MPath

class CollectionTests: XCTestCase {

	func testAllExist() {
		let paths: [Path] = ["/tmp", "/usr", "/bin"]
		XCTAssertTrue(paths.allExist)

		let nonExistingPaths: [Path] = ["/asdf", "/123"]
		XCTAssertFalse(nonExistingPaths.allExist)
	}
}
