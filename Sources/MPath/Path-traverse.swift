/*
 * This section of code was heavily borrowed and inspired by [PathKit](https://github.com/kylef/PathKit/blob/master/Sources/PathKit.swift). 
 * The license for the borrowed code is available [here](https://github.com/kylef/PathKit/blob/master/LICENSE).
 */

extension Path {
  public func parent() -> Path {
    return self + ".."
  }

  /// Performs a shallow enumeration in a directory
  ///
  /// - Returns: paths to all files, directories and symbolic links contained in the directory
  ///
  public func children() throws -> [Path] {
    return try Self.fileManager.contentsOfDirectory(atPath: path).map {
      self + Path($0)
    }
  }

  /// Performs a deep enumeration in a directory
  ///
  /// - Returns: paths to all files, directories and symbolic links contained in the directory or
  ///   any subdirectory.
  ///
  public func recursiveChildren() throws -> [Path] {
    return try Self.fileManager.subpathsOfDirectory(atPath: path).map {
      self + Path($0)
    }
  }
}
