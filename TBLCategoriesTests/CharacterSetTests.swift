import TBLCategories
import XCTest
import Nimble

class CharacterSetTests : XCTestCase {

    func testEmoji() {
        let emoji = CharacterSet.emojiCharacterSet
        expect("😀".rangeOfCharacter(from: emoji)).toNot(beNil())
        expect(emoji.contains("😀")).to(beTrue())
        expect(emoji.contains("a")).to(beFalse())
    }
}
