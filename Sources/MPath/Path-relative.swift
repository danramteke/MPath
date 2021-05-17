import Foundation

extension Path {
  public func relative(to parent: Path) -> Path {
    var meAbs = self.absolute().path
    let parentsAbs = parent.absolute().path

    guard meAbs.starts(with: parentsAbs) else {
      return self
    }

    meAbs.removeSubrange(...parentsAbs.endIndex)

    return Path(meAbs)
  }
}
