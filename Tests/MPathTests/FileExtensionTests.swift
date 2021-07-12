import Foundation
import XCTest
import MPath

class FileExtensionTests: XCTestCase {
	func testFileExtension() {
		XCTAssertEqual(Path("vim").extension, nil)
		XCTAssertEqual(Path("asdf.txt").extension, "txt")
		XCTAssertEqual(Path("asdf.html.asp").extension, "asp")

		XCTAssertEqual(Path("/tmp/file.txt").filename, "file.txt")
		XCTAssertEqual(Path("/tmp/file.txt").filenameWithoutExtension, "file")
		XCTAssertEqual(Path("/tmp/file.txt").path(newExtension: "gif"), "/tmp/file.gif")
		XCTAssertEqual(Path("/tmp/file.txt").filename(newExtension: "gif"), "file.gif")
	}

	
}
