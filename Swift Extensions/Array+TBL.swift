import Foundation

extension Array {
    mutating func insert(_ element: Element, safeAt index: Index) {
        var safeIndex = index
        if index < 0 {
            safeIndex = 0
        } else if index > count {
            safeIndex = count
        }
        insert(element, at: safeIndex)
    }

    var nilIfEmpty: [Element]? {
        return isEmpty ? nil : self
    }

    mutating func append(safe element: Element?) {
        guard let element = element else { return }
        append(element)
    }
}
