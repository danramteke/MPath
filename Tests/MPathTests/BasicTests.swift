import XCTest
@testable import MPath

final class BasicTests: XCTestCase {
  func testExists() {
    XCTAssertEqual(Path("/tmp").exists, true)
    XCTAssertEqual(Path.current.exists, true)
  }

  func testDefaultConstructor() {
    XCTAssertEqual(Path().string, "")
  }

  func testURLConversion() {
    XCTAssertEqual(Path("/bin/sh").url, URL(fileURLWithPath: "/bin/sh"))
  }

  func testCurrentPath() {
    let actual = Path.current
    let expected = FileManager.default.currentDirectoryPath

    XCTAssertEqual(actual.path, expected)
  }
}
