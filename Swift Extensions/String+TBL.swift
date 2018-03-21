import Foundation

public extension String {
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, comment: "")
    }

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

    public var nilIfEmpty: String? {
        return isEmpty ? nil : self
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
        let rest = index(startIndex, offsetBy: 1)..<endIndex
        let capitalized = self[startIndex...startIndex].uppercased() + self[rest]

        return capitalized
    }

    public static func localized(_ key: String, table: String? = nil, comment: String? = nil) -> String {
        return NSLocalizedString(key, tableName: table, comment: comment ?? "")
    }

    public func localized(with params: String...) -> String {
        return String(format: localized, arguments: params)
    }

    func truncateTo(_ maxCharacters: Int, appendIfTruncated suffix: String? = nil) -> String {
        guard maxCharacters >= 0, count > maxCharacters else {
            return self
        }

        let truncated = prefix(maxCharacters)
        if let suffix = suffix {
            return truncated + suffix
        } else {
            return String(truncated)
        }
    }
}
