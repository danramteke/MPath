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
    XCTAssertEqual(parent.absolute().path, dotdotdotdot.absolute().path)
  }
}
