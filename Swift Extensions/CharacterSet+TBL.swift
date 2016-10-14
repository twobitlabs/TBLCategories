
import Foundation

extension CharacterSet {

    @nonobjc public static let emojiCharacterSet: CharacterSet = {
        // https://en.wikipedia.org/wiki/Emoji#Unicode_blocks
        let ranges: [(begin: UInt32, end: UInt32)] = [
            (0x1F300, 0x1F321),
            (0x1F324, 0x1F393),
            (0x1F396, 0x1F397),
            (0x1F399, 0x1F39B),
            (0x1F39E, 0x1F3F0),
            (0x1F3F3, 0x1F3F5),
            (0x1F3F7, 0x1F4FD),
            (0x1F4FF, 0x1F53D),
            (0x1F549, 0x1F567),
            (0x1F56F, 0x1F570),
            (0x1F56F, 0x1F570),
            (0x1F573, 0x1F579),
            (0x1F587, 0x1F587),
            (0x1F58A, 0x1F58D),
            (0x1F590, 0x1F590),
            (0x1F595, 0x1F596),
            (0x1F5A5, 0x1F5A5),
            (0x1F5A8, 0x1F5A8),
            (0x1F5B1, 0x1F5B2),
            (0x1F5BC, 0x1F5BC),
            (0x1F5C2, 0x1F5C4),
            (0x1F5D1, 0x1F5D3),
            (0x1F5DC, 0x1F5DE),
            (0x1F5E1, 0x1F5E1),
            (0x1F5E3, 0x1F5E3),
            (0x1F5E8, 0x1F5E8),
            (0x1F5EF, 0x1F5EF),
            (0x1F5F3, 0x1F5F3),
            (0x1F5FA, 0x1F64F),
            (0x1F680, 0x1F6C5),
            (0x1F6CB, 0x1F6D0),
            (0x1F6E0, 0x1F6E5),
            (0x1F6E9, 0x1F6E9),
            (0x1F6EB, 0x1F6EC),
            (0x1F6F0, 0x1F6F0),
            (0x1F6F3, 0x1F6F3),
            (0x1F910, 0x1F918),
            (0x1F980, 0x1F984),
            (0x1F9C0, 0x1F9C0),
            (0x2600, 0x269C),
            (0x26A0, 0x26B2),
            (0x26BD, 0x26BE),
            (0x26C4, 0x26C5),
            (0x26C8, 0x26C8),
            (0x26CE, 0x26CF),
            (0x26D1, 0x26D1),
            (0x26D3, 0x26D4),
            (0x26E2, 0x26E2),
            (0x26E9, 0x26EA),
            (0x26F0, 0x26F5),
            (0x26F7, 0x26FA),
            (0x26FD, 0x26FD),
            (0x2701, 0x275E),
            (0x2761, 0x27BF)
        ]
        var emojiCharacterSet = CharacterSet()
        for range in ranges {
            emojiCharacterSet.insert(charactersIn: UnicodeScalar(range.begin)!...UnicodeScalar(range.end)!)
        }
        return emojiCharacterSet
    }()

    public var characters:[String] {
        var chars = [String]()
        for plane:UInt8 in 0...16 {
            if (self as NSCharacterSet).hasMemberInPlane(plane) {
                let p0 = UInt32(plane) << 16
                let p1 = (UInt32(plane) + 1) << 16
                for c:UTF32Char in p0..<p1 {
                    if (self as NSCharacterSet).longCharacterIsMember(c) {
                        var c1 = c.littleEndian
                        let s = NSString(bytes: &c1, length: 4, encoding: String.Encoding.utf32LittleEndian.rawValue)!
                        chars.append(String(s))
                    }
                }
            }
        }
        return chars
    }
}
