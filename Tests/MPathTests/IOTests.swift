import Foundation
import XCTest
@testable import MPath

class IOTests: XCTestCase {

  var tmp: Path!
  override func setUpWithError() throws {
    tmp = Path("/tmp/MPathTestOutput/") + Path(String(describing: Self.self))
    try? tmp.delete()
    try tmp.createDirectories()
  }

  func testCreateDirectories() throws {
    XCTAssertTrue(tmp.exists)

    let distantDir = tmp + #function + "some" + "distant" + "directory"
    try distantDir.createDirectories()
    XCTAssertTrue(distantDir.exists)
    XCTAssertTrue(distantDir.isDirectory)
  }

  func testCreateFile() throws {
    XCTAssertTrue(tmp.exists)

    let file = tmp + "empty.txt"
    try file.createEmptyFile()
    XCTAssertTrue(file.exists)
    XCTAssertTrue(file.isFile)
  }

  func testDeleteFile() throws {
    XCTAssertTrue(tmp.exists)

    let file = tmp + "empty.txt"
    try file.createEmptyFile()
    XCTAssertTrue(file.exists)
    XCTAssertTrue(file.isFile)
    try file.delete()
    XCTAssertFalse(file.exists)
    XCTAssertFalse(file.isFile)
  }
}
