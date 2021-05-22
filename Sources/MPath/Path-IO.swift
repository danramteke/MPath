import Foundation

extension Path {
  public func clear() throws {
    try self.write(Data())
  }

  public func read() throws -> Data {
    try Data(contentsOf: self.url, options: [])
  }

  public func write(_ data: Data) throws {
    try data.write(to: self.url)
  }

  public func read(using encoding: String.Encoding) throws -> String {
    try String(contentsOf: self.url, encoding: encoding)
  }

  public func write(string: String, _ encoding: String.Encoding) throws {
    try string.write(to: self.url, atomically: true, encoding: encoding)
  }
}

extension Data {
  public init(path: Path) throws {
    self = try path.read()
  }

  public func write(to path: Path) throws {
    try path.write(self)
  }
}

extension String {
  public func write(to path: Path, encoding: String.Encoding = .utf8) throws {
    try path.write(string: self, encoding)
  }

  public init(path: Path, trimming: Bool = true, encoding: String.Encoding = .utf8) throws {
    let string = try path.read(using: encoding)

    if trimming {
      self = string.trimmingCharacters(in: .whitespacesAndNewlines) 
    } else {
      self = string
    }
  }
}
