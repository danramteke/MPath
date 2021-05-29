import Foundation

extension Path {

	public func isEmpty() throws -> Bool {
		try fileSize() == 0
	}

	public func fileSize() throws -> Int {
		let number = try self.attribute(for: .size) as? NSNumber
		guard let intValue = number?.intValue else {
			throw FileAttributesReadingError(key: .size, path: self)
		}
		return intValue
	}

	public func creationDate() throws -> Date {
		let maybeDate = try self.attribute(for: .creationDate) as? NSDate
		guard let date = maybeDate else {
			throw FileAttributesReadingError(key: .creationDate, path: self)
		}
		return date as Date
	}

	public func modificationDate() throws -> Date {
		let maybeDate = try self.attribute(for: .modificationDate) as? NSDate
		guard let date = maybeDate else {
			throw FileAttributesReadingError(key: .modificationDate, path: self)
		}
		return date as Date
	}

	public func attributes() throws -> [FileAttributeKey : Any] {
		try Self.fileManager.attributesOfItem(atPath: self.path)
	}

	public func attribute(for attribute: FileAttributeKey) throws -> Any? {
		let attributes = try self.attributes()
		return attributes[attribute]
	}
}

public struct FileAttributesReadingError: Error {
	public let key: FileAttributeKey
	public let path: Path
}
