import Foundation

public extension String {
    
    public func contains(substring: String, ignoreCase: Bool = false) -> Bool {
        if let range = ignoreCase ?
            rangeOfString(substring, options: .CaseInsensitiveSearch) :
            rangeOfString(substring) {
            return !range.isEmpty
        } else {
            return false
        }
    }

    public static func localized(key: String, table: String) -> String {
        return NSLocalizedString(key, tableName: table, comment: "")
    }
    
}