import Foundation

extension NSTextCheckingResult {
    @available(watchOSApplicationExtension 4.0, *)
    func match(for name: String, in text: String) -> String? {
        let nsRange = range(withName: name)
        guard nsRange.location != NSNotFound,
              let range = Range(nsRange, in: text) else { return nil }
        return String(text[range])
    }
}
