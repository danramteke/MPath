import Foundation

public struct Path: Codable, Equatable, Comparable, Hashable {

  public let path: String
  public init(_ path: String = "") {
    self.path = path
  }
  public init(url: URL) {
    self.init(url.absoluteURL.standardizedFileURL.path)
  }
  public static let separator: String = "/"
  public var components: [String] {
    path.split(separator: Character(Self.separator)).map(String.init)
  }
    
  public var quoted: String {
    if !path.starts(with: "\"") && !path.hasSuffix("\"") && !path.contains("\"") {
      return "\"\(self.path)\""
    } else {
      return self.path
    }
  }

  public var url: URL {
    URL(fileURLWithPath: path)
  }

  public var string: String {
    path
  }

  public static func < (lhs: Path, rhs: Path) -> Bool {
    lhs.path < rhs.path
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(path)
  }
}
