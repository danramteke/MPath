import Foundation
import XCTest
import MPath

class FileExtensionTests: XCTestCase {
	func testFileExtension() {
		XCTAssertEqual(Path("vim").extension, nil)
		XCTAssertEqual(Path("asdf.txt").extension, "txt")
		XCTAssertEqual(Path("asdf.html.asp").extension, "asp")
	}
}
