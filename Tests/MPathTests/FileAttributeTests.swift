import Foundation
import XCTest
import MPath

class FileAttributeTests: XCTestCase {
	var tmp: Path!
	override func setUpWithError() throws {
		tmp = Path("/tmp/MPathTestOutput/") + Path(String(describing: Self.self))
		try? tmp.delete()
		try tmp.createDirectories()
	}

	func testEmptyFileSize() throws {
		XCTAssertTrue(tmp.exists)

		let dir = tmp + #function
		let file = dir + "empty.txt"

		try file.createEmptyFile()

		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)

		try String().write(to: file)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)

		try Data().write(to: file)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)

		try "".write(to: file)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)
	}

	func testSmallFileSize() throws {
		XCTAssertTrue(tmp.exists)

		let dir = tmp + #function
		let file = dir + "small.txt"
		try file.createEmptyFile()

		let contents = "small file contents"
		try contents.write(to: file)

		XCTAssertFalse(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 19)
	}

	func testFileDates() throws {
		XCTAssertTrue(tmp.exists)

		let dir = tmp + #function
		let file = dir + "file.txt"
		try file.createEmptyFile()

		let modificationDate = try file.modificationDate()
		let creationDate = try file.creationDate()

		XCTAssertEqual(modificationDate, creationDate)
		XCTAssertTrue(creationDate.timeIntervalSinceNow < 60)

		let contents = "small file contents"
		try contents.write(to: file)

		let modificationDate2 = try file.modificationDate()
		let creationDate2 = try file.creationDate()

		XCTAssertNotEqual(modificationDate2, creationDate2)
	}
}
