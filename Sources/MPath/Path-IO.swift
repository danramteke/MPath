import Foundation

extension Path {
  public func clear() throws {
    try Data().write(to: self)
  }
}

extension Data {
  public init(path: Path) throws {
    try self.init(contentsOf: path.url)
  }

  public func write(to path: Path) throws {
    try self.write(to: path.url, options: .atomic)
  }
}

extension String {
  public func write(to path: Path) throws {
    try self.data(using: .utf8)!.write(to: path)
  }

  public init(path: Path, trimming: Bool = true) throws {
    let data = try Data.init(contentsOf: path.url)
    guard let string = String.init(data: data, encoding: .utf8) else {
      throw StringEncodingError(path: path, encoding: .utf8)
    }
    if trimming {
      self = string.trimmingCharacters(in: .whitespacesAndNewlines) 
    } else {
      self = string
    }
  }

  public struct StringEncodingError: Error, LocalizedError {
    let path: Path
    let encoding: String.Encoding

    public var errorDescription: String? {
      "Couldn't read as \(encoding.description) at \(path.absolute())"
    }

    init(path: Path, encoding:  String.Encoding) {
      self.path = path
      self.encoding = encoding
    }
  }
}