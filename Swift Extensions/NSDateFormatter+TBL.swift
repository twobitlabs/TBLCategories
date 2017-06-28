
import Foundation

extension DateFormatter {
    static let localeAgnosticFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
