import XCTest
@testable import MPath

final class PermissionsTests: XCTestCase {

  override func setUp() {
    try? Path("/tmp/test").delete()
  }

  func testReadableEtcetera() throws {
    let testFile = Path("/tmp/test")
    XCTAssertEqual(testFile.exists, false)
    XCTAssertEqual(testFile.isReadable, false)
    XCTAssertEqual(testFile.isWritable, false)
    XCTAssertEqual(testFile.isExecutable, false)

    #if os(Linux)
    XCTAssertEqual(testFile.isDeletable, false)
    #else
    XCTAssertEqual(testFile.isDeletable, true)
    #endif

    try testFile.write(Data())
    XCTAssertEqual(testFile.exists, true)
    XCTAssertEqual(testFile.isReadable, true)
    XCTAssertEqual(testFile.isWritable, true)
    XCTAssertEqual(testFile.isExecutable, false)
    XCTAssertEqual(testFile.isDeletable, true)
  }
}