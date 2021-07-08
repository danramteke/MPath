import Foundation

extension Path {
  public var isReadable: Bool {
    Self.fileManager.isReadableFile(atPath: self.path)
  }

  public var isWritable: Bool {
    Self.fileManager.isWritableFile(atPath: self.path)
  }

  public var isExecutable: Bool {
    Self.fileManager.isExecutableFile(atPath: self.path)
  }

  public var isDeletable: Bool {
    Self.fileManager.isDeletableFile(atPath: self.path)
  }
}
