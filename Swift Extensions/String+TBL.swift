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
            print("foo")
            return false
        }
    }

    var hasNonEmptyValue: Bool {
        return !isEmpty
    }

    var nilIfEmpty: String? {
        return isEmpty ? nil : self
    }

    var containsEmoji: ContainsEmoji {
        if #available(iOS 13.0, *) {
            let tokenizer = NLTokenizer(unit: .word)
            tokenizer.string = self
            var hasEmoji = false
            tokenizer.enumerateTokens(in: self.startIndex..<self.endIndex) { (range, attributes) -> Bool in
                print("enumerating \(self) \(range) \(attributes)")
                if attributes.contains(.emoji) || attributes.contains(.symbolic) { // flag emoji are symbols
                    hasEmoji = true
                    return false
                } else {
                    return true
                }
            }
            return hasEmoji ? .yes : .no
        } else {
            return .unknown
        }
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
