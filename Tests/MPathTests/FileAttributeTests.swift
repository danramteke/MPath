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

		let file = tmp + "empty.txt"

		try file.createEmptyFile()
		XCTAssertTrue(file.exists)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)

		try String().write(to: file)
		XCTAssertTrue(file.exists)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)

		try Data().write(to: file)
		XCTAssertTrue(file.exists)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)

		try "".write(to: file)
		XCTAssertTrue(file.exists)
		XCTAssertTrue(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 0)
	}

	func testSmallFileSize() throws {
		XCTAssertTrue(tmp.exists)

		let file = tmp + "small.txt"
		try file.createEmptyFile()
		XCTAssertTrue(file.exists)

		let contents = "small file contents"
		try contents.write(to: file)

		XCTAssertTrue(file.exists)
		XCTAssertFalse(try file.isEmpty())
		XCTAssertEqual(try file.fileSize(), 19)
	}

	func testFileDates() throws {
		XCTAssertTrue(tmp.exists)

		let file = tmp + "file.txt"
		try file.createEmptyFile()
		XCTAssertTrue(file.exists)

		let modificationDate = try file.modificationDate()
		XCTAssertTrue(modificationDate.timeIntervalSinceNow < 60)
		#if !os(Linux)
		let creationDate = try file.creationDate()
		XCTAssertEqual(modificationDate, creationDate)
		#endif
		

		let contents = "small file contents"
		try contents.write(to: file)

		let modificationDate2 = try file.modificationDate()
		XCTAssertTrue(modificationDate2.timeIntervalSinceNow < 60)
		#if !os(Linux)
		let creationDate2 = try file.creationDate()
		XCTAssertNotEqual(modificationDate2, creationDate2)
		#endif
	}
}
