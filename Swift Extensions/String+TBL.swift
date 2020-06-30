import Foundation
import NaturalLanguage

public extension String {

    enum ContainsEmoji {
        case yes
        case no
        case unknown
    }

    var localized: String {
        return NSLocalizedString(self, tableName: nil, comment: "")
    }

    func contains(_ substring: String, ignoreCase: Bool = false) -> Bool {
        if let range = ignoreCase ?
            range(of: substring, options: .caseInsensitive) :
            range(of: substring) {
            return !range.isEmpty
        } else {
            return false
        }
    }

    var hasNonEmptyValue: Bool {
        return !isEmpty
    }

    var nilIfEmpty: String? {
        return isEmpty ? nil : self
    }

    var isDigitsOnly: Bool {
        guard !isEmpty else { return false }
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }

    @available(iOS 13.0, *)
    @available(watchOS 3.1.1, *)
    var containsEmoji: Bool {
        guard !isDigitsOnly else { return false }
        for scalar in unicodeScalars {
            if CharacterSet.decimalDigits.contains(scalar) { continue }
            if CharacterSet.punctuationCharacters.contains(scalar) { continue }
            if scalar.properties.isEmoji { return true }
        }
        return false
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

    static func localized(_ key: String, table: String? = nil, comment: String? = nil) -> String {
        return NSLocalizedString(key, tableName: table, comment: comment ?? "")
    }

    func localized(with params: String...) -> String {
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
