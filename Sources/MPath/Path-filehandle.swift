import Foundation

extension Path {
  static let fileManager: FileManager = FileManager.default

  public func createDirectories() throws {
    try Self.fileManager.createDirectory(atPath: self.path,
                                         withIntermediateDirectories: true)
  }

  public func createEmptyFile() throws  {
    if !self.parent().exists {
      try self.parent().createDirectories()
    }

    try self.write(Data())
  }

  public func fileHandleForWriting() throws -> FileHandle {
    return try FileHandle(forWritingTo: self.url)
  } 

  public var exists: Bool {
    Self.fileManager.fileExists(atPath: self.path)
  }

  public static var current: Path {
    .init(Self.fileManager.currentDirectoryPath)
  }

  public func delete() throws {
     try Self.fileManager.removeItem(atPath: self.path)
  }

  public func copy(to destination: Path) throws {
    try Self.fileManager.copyItem(atPath: self.path, toPath: destination.path)
  }
}
