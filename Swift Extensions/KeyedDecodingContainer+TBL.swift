import Foundation

// Inspired by http://kean.github.io/post/codable-tips-and-tricks#41-getting-rid-of-explicit-type-parameters

struct OptionalDecodable<T: Decodable>: Decodable {
    public let value: T?

    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(T.self)
        } catch {
            print("Error decoding \(String(describing: T.self)) \(error)")
            self.value = nil
        }
    }
}

extension KeyedDecodingContainer {
    public func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
        return try self.decode(T.self, forKey: key)
    }

    public func decodeIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) throws -> T? {
        return try decodeIfPresent(T.self, forKey: key)
    }
}

extension KeyedDecodingContainer {
    public func decodeOptional<T: Decodable>(_ key: KeyedDecodingContainer.Key) -> T? {
        return self.decodeOptional(T.self, forKey: key)
    }

    public func decodeOptional<T: Decodable>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? {
        let decoded = try? decodeIfPresent(OptionalDecodable<T>.self, forKey: key)
        return decoded??.value
    }

    public func decodeArray<T: Decodable>(of type: T.Type, forKey key: KeyedDecodingContainer.Key) throws -> [T] {
        let array = try decode([OptionalDecodable<T>].self, forKey: key)
        return array.compactMap { $0.value }
    }

    public func decodeOptionalArray<T: Decodable>(of type: T.Type, forKey key: KeyedDecodingContainer.Key) -> [T]? {
        let array = decodeOptional([OptionalDecodable<T>].self, forKey: key)
        return array?.compactMap { $0.value }
    }
}

extension JSONDecoder {
    public func decodeOptional<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        let decoded = try? decode(OptionalDecodable<T>.self, from: data)
        return decoded?.value
    }

    public func decodeArray<T: Decodable>(of type: T.Type, from data: Data) throws -> [T] {
        let array = try decode([OptionalDecodable<T>].self, from: data)
        return array.compactMap { $0.value }
    }

    public func decodeOptionalArray<T: Decodable>(of type: T.Type, from data: Data) -> [T]? {
        let array = decodeOptional([OptionalDecodable<T>].self, from: data)
        return array?.compactMap { $0.value }
    }
}
