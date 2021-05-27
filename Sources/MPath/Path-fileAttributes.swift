import Foundation

extension Path {

	public func isEmpty() throws -> Bool {
		try fileSize() == 0
	}

	public func fileSize() throws -> Int {
		let number = try self.attribute(for: FileAttributeKey.size) as? NSNumber
		guard let intValue = number?.intValue else {
			throw FileAttributesReadingError()
		}
		return intValue
	}

	public func creationDate() throws -> Date {
		let maybeDate = try self.attribute(for: FileAttributeKey.creationDate) as? NSDate
		guard let date = maybeDate else {
			throw FileAttributesReadingError()
		}
		return date as Date
	}

	public func modificationDate() throws -> Date {
		let maybeDate = try self.attribute(for: FileAttributeKey.modificationDate) as? NSDate
		guard let date = maybeDate else {
			throw FileAttributesReadingError()
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

public struct FileAttributesReadingError: Error { }
