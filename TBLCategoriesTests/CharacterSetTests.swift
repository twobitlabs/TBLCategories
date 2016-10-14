import TBLCategories
import XCTest
import Nimble

class CharacterSetTests : XCTestCase {

    func testEmoji() {
        let emoji = CharacterSet.emojiCharacterSet
        print(emoji.characters.joined(separator: ""))
        expect("😀".rangeOfCharacter(from: emoji)).toNot(beNil())
        expect(emoji.contains("😀")).to(beTrue())
    }
}
