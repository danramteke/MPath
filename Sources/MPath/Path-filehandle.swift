import Foundation

extension Path {
  static let fileManager: FileManager = FileManager.default

  public func createDirectories() throws {
    try Self.fileManager.createDirectory(atPath: self.path, withIntermediateDirectories: true)
  }

  @discardableResult
  public func createEmptyFile() throws -> Bool {
    if !self.parent().exists {
      try self.parent().createDirectories()
    }
    return Self.fileManager.createFile(atPath: self.path, contents: nil)
  }

  public func fileHandleForWriting() throws -> FileHandle {
    return try FileHandle(forWritingTo: self.url)
  } 

  public var exists: Bool {
    Path.fileManager.fileExists(atPath: self.path)
  }

  public static var current: Path {
    .init(Self.fileManager.currentDirectoryPath)
  }
}
