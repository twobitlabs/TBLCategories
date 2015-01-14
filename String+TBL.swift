
extension String {
    func contains(substring: String, ignoreCase: Bool = false) -> Bool {
        if let range = ignoreCase ?
            rangeOfString(substring, options: .CaseInsensitiveSearch) :
            rangeOfString(substring) {
            return !range.isEmpty
        } else {
            return false
        }
    }
}