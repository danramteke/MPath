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
    let path = Path("/bin/sh")
    let url = URL(fileURLWithPath: "/bin/sh")
    XCTAssertEqual(path.url, url)
    XCTAssertEqual(path.url.absoluteString, "file:///bin/sh")
    XCTAssertEqual(url.absoluteString, "file:///bin/sh")
  }

  func testCurrentPath() {
    let actual = Path.current
    let expected = Path(FileManager.default.currentDirectoryPath)

    XCTAssertEqual(actual, expected)
  }

#if targetEnvironment(macCatalyst)
  
#else
 func testHomePath() {
    let actual = Path.home
    let expected = Path(url: FileManager.default.homeDirectoryForCurrentUser)

    XCTAssertEqual(actual, expected)
  }
#endif
}
