
extension Dictionary {
    /**
        Convenience initializer to create a dictionary seeded with another dictonary.
        Handy for creating a dictionary you want to modify, seeded with an input parameter.
     */
    init(withDictionary: Dictionary<Key, Value>?) {
        self.init()
        if let inDictionary = withDictionary {
            for (key, value) in inDictionary {
                self[key] = value
            }
        }
    }

    /**
        Return the boolean at the given key, or the default value if that key doesn't exist or is not a bool
     */
    public subscript (bool key: Key, default defaultValue: Bool) -> Bool {
        guard let value = self[key] as? Bool else { return defaultValue }
        return value
    }
    
    mutating func merge(_ other: [Key : Value], favoring: MergeFavoring) {
        switch favoring {
        case .existing:
            merge(other, uniquingKeysWith: { (existingValue, _) in
                return existingValue })
        case .new:
            merge(other, uniquingKeysWith: { (_, newValue) in
                return newValue })
        }
    }
    
    func merging(_ other: [Key : Value], favoring: MergeFavoring) -> [Key: Value] {
        switch favoring {
        case .existing:
            return merging(other, uniquingKeysWith: { (existingValue, _) in
                return existingValue })
        case .new:
            return merging(other, uniquingKeysWith: { (_, newValue) in
                return newValue })
        }
    }
}

extension Dictionary where Key: Comparable {
    /// A string that represents the contents of the dictionary with the keys sorted in ascending order.
    var sortedDescription: String {
        let sortedDescriptionFields = keys.sorted().reduce(into: [String]()) { (result, key) in
            let value = self[key]
            let valueOutput: String
            if let value = value as? String {
                valueOutput = "\"\(value)\""
            } else if let value = value {
                valueOutput = "\(value)"
            } else {
                valueOutput = "nil"
            }
            result.append("\"\(key)\": \(valueOutput)")
        }
        return "[\(sortedDescriptionFields.joined(separator: ", "))]"
    }
}

enum MergeFavoring {
    case existing
    case new
}
