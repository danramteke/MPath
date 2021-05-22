import Foundation
import XCTest
@testable import MPath

final class RelativePathTests: XCTestCase {
  func testParent() {
    let current = Path.current
    let parent = Path.current.parent()
    
    let dotdot = current + ".."
    XCTAssertEqual(parent.absolute().path, dotdot.absolute().path)
  }
  
  func testParentParent() {
    let current = Path.current
    let parent = Path.current.parent().parent()
    
    let dotdotdotdot = current + ".." + ".."
    XCTAssertEqual(parent.path, dotdotdotdot.path)
    XCTAssertEqual(parent.absolute().path, dotdotdotdot.absolute().path)
  }

  func testSibling() {
    let current = Path.current
    let sibling = Path.current.parent() + "sibling"

    XCTAssertEqual((current + "../sibling").path, sibling.path)
    XCTAssertEqual((current + "../sibling").absolute().path, sibling.absolute().path)
  }

  func testRelative() {
    let base: Path = "/abc/xyz"
    let longPath: Path = "/abc/xyz/long/path"

    XCTAssertEqual(longPath.relative(to: base), "long/path")
  }

  func testConcat() {
    let path: Path = "abc" + "xyz"
    XCTAssertEqual(path.string, "abc/xyz")
  }

  func testAsRelative() {
    let one: Path = "abc"
    let two: Path = "/xyz"

    XCTAssertEqual(one.asRelative.string, "abc")
    XCTAssertEqual(two.asRelative.string, "xyz")
    
    XCTAssertEqual(one + two, "/xyz")
    XCTAssertEqual(one + two.asRelative, "abc/xyz")
  }
}
