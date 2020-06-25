import TBLCategories
import Quick
import Nimble

class StringTests: QuickSpec {

    override func spec() {

        describe("containsEmoji") {
            if#available(iOS 13.0, *) {
                it("should recognize emoji") {
                    expect("".containsEmoji).to(beFalse())
                    expect(" ".containsEmoji).to(beFalse())
                    expect("a".containsEmoji).to(beFalse())
                    expect("foo bar baz".containsEmoji).to(beFalse())
                    expect("™️".containsEmoji).to(beTrue())
                    expect("☂︎".containsEmoji).to(beTrue())
                    expect("®".containsEmoji).to(beTrue())
                    expect("☁︎".containsEmoji).to(beTrue())
                    expect(";!@#$%^&*()".containsEmoji).to(beFalse())
                    expect("1234".containsEmoji).to(beFalse())
                    expect("a😀".containsEmoji).to(beTrue())
                    expect("😀😀".containsEmoji).to(beTrue())
                    expect("😎".containsEmoji).to(beTrue())
                    expect("💤".containsEmoji).to(beTrue())
                    expect("💀".containsEmoji).to(beTrue())
                    expect("👻".containsEmoji).to(beTrue())
                    expect("👽".containsEmoji).to(beTrue())
                    expect("🤖".containsEmoji).to(beTrue())
                    expect("⛵️".containsEmoji).to(beTrue())
                    expect("🖇".containsEmoji).to(beTrue())
                    expect("🖐".containsEmoji).to(beTrue())
                    expect("🤐".containsEmoji).to(beTrue())
                    expect("🤘🏻".containsEmoji).to(beTrue())
                    expect("🦀".containsEmoji).to(beTrue())
                    expect("🦄".containsEmoji).to(beTrue())
                    expect("🧀".containsEmoji).to(beTrue())
                    expect("🖼".containsEmoji).to(beTrue())
                    expect("🗿".containsEmoji).to(beTrue())
                    expect("😺".containsEmoji).to(beTrue())
                    expect("👌".containsEmoji).to(beTrue())
                    expect("🖕🏻".containsEmoji).to(beTrue())
                    expect("👍🏻".containsEmoji).to(beTrue())
                    expect("👍".containsEmoji).to(beTrue())
                    expect("👍🏽".containsEmoji).to(beTrue())
                    expect("👍🏿".containsEmoji).to(beTrue())
                    expect("⚡️".containsEmoji).to(beTrue())
                    expect("🤡".containsEmoji).to(beTrue())
                    expect("🥋".containsEmoji).to(beTrue())
                    expect("🤙".containsEmoji).to(beTrue())
                    expect("🤞".containsEmoji).to(beTrue())
                    expect("🤴".containsEmoji).to(beTrue())
                    expect("🥃".containsEmoji).to(beTrue())
                    expect("🥑".containsEmoji).to(beTrue())
                    expect("🦏".containsEmoji).to(beTrue())
                    expect("🤢".containsEmoji).to(beTrue())
                    expect("🛒".containsEmoji).to(beTrue())
                    expect("🛰".containsEmoji).to(beTrue())
                    expect("🛶".containsEmoji).to(beTrue())
                    expect("🦑".containsEmoji).to(beTrue())
                    expect("🤦".containsEmoji).to(beTrue())
                    expect("🧜‍♀️".containsEmoji).to(beTrue())
                    expect("🇮🇹".containsEmoji).to(beTrue())
                    expect("👨‍👨‍👧‍👧".containsEmoji).to(beTrue())
                }
            }
        }
    }
}
