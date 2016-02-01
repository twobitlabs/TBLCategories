
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

}