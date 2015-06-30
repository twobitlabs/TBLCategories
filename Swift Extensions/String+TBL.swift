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

    /**
    Capitalize the first letter as opposed to .capitalizedString which lowercases
    the string and then capitalizes every word in it.

    :returns: Same string with the first letter uppercased
    */
    func capitalizeFirstLetter() -> String {
        if startIndex == endIndex {
            return self
        }
        let rest = advance(startIndex,1)..<endIndex
        let capitalized = self[startIndex...startIndex].uppercaseString + self[rest]

        return capitalized
    }

    public static func localized(key: String, table: String) -> String {
        return NSLocalizedString(key, tableName: table, comment: "")
    }
    
}