
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
}
