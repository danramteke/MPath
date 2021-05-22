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

  public var asRelative: Path {
    guard string.hasPrefix(Path.separator) else {
      return self
    }    
    
    return Path(String(string[string.index(after: string.startIndex)...]))
  }
}
