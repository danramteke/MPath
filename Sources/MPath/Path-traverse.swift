/*
 * This section of code was heavily borrowed and inspired by [PathKit](https://github.com/kylef/PathKit/blob/master/Sources/PathKit.swift). 
 * The license for the borrowed code is available [here](https://github.com/kylef/PathKit/blob/master/LICENSE).
 */
import Foundation

extension Path {
  /// Similar to recursive children but only returns files
  /// - Returns: paths to all files contained in the directory or
  ///   any subdirectory.
  public func leaves() throws -> [Path] {
    try self.recursiveChildren()
      .filter { $0.isFile }
  }

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

  /// Test whether a path is a directory.
  ///
  /// - Returns: `true` if the path is a directory or a symbolic link that points to a directory;
  ///   `false` if the path is not a directory or the path doesn't exist on disk or its existence
  ///   could not be determined
  ///
  public var isDirectory: Bool {
    var directory = ObjCBool(false)
    guard Path.fileManager.fileExists(atPath: normalize().path, isDirectory: &directory) else {
      return false
    }
    return directory.boolValue
  }

  /// Test whether a path is a regular file.
  ///
  /// - Returns: `true` if the path is neither a directory nor a symbolic link that points to a
  ///   directory; `false` if the path is a directory or a symbolic link that points to a
  ///   directory or the path doesn't exist on disk or its existence
  ///   could not be determined
  ///
  public var isFile: Bool {
    var directory = ObjCBool(false)
    guard Path.fileManager.fileExists(atPath: normalize().path, isDirectory: &directory) else {
      return false
    }
    return !directory.boolValue
  }

  /// Test whether a path is a symbolic link.
  ///
  /// - Returns: `true` if the path is a symbolic link; `false` if the path doesn't exist on disk
  ///   or its existence could not be determined
  ///
  public var isSymlink: Bool {
    do {
      let _ = try Path.fileManager.destinationOfSymbolicLink(atPath: path)
      return true
    } catch {
      return false
    }
  }
}
