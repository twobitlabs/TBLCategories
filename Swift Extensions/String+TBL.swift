import Foundation

public extension String {
    
    public func contains(_ substring: String, ignoreCase: Bool = false) -> Bool {
        if let range = ignoreCase ?
            range(of: substring, options: .caseInsensitive) :
            range(of: substring) {
            return !range.isEmpty
        } else {
            return false
        }
    }

    public var hasNonEmptyValue: Bool {
        return !isEmpty
    }

    /**
    Capitalize the first letter as opposed to .capitalizedString which lowercases
    the string and then capitalizes every word in it.

    - returns: Same string with the first letter uppercased
    */
    func capitalizeFirstLetter() -> String {
        if startIndex == endIndex {
            return self
        }
        let rest = characters.index(startIndex, offsetBy: 1)..<endIndex
        let capitalized = self[startIndex...startIndex].uppercased() + self[rest]

        return capitalized
    }

    public static func localized(_ key: String, table: String? = nil, comment: String? = nil) -> String {
        return NSLocalizedString(key, tableName: table, comment: comment ?? "")
    }

    func truncateTo(_ maxCharacters: Int, appendIfTruncated suffix: String? = nil) -> String {
        guard characters.count > maxCharacters else {
            return self
        }

        let truncated = (self as NSString).substring(to: maxCharacters - 1)
        if let suffix = suffix {
            return truncated + suffix
        } else {
            return truncated
        }
    }
}
