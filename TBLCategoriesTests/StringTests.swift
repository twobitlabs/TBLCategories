import TBLCategories
import Quick
import Nimble

class StringTests: QuickSpec {

    override func spec() {
        describe("containsEmoji") {
            it("should recognize emoji") {
                if #available(iOS 13.0, *) {
                    expect("a".containsEmoji).to(equal(.no))
                    expect("foo bar baz".containsEmoji).to(equal(.no))
                    expect("↓".containsEmoji).to(equal(.yes)) //symbolic
                    expect("™️".containsEmoji).to(equal(.yes)) //symbolic
                    expect("☂︎".containsEmoji).to(equal(.yes)) //emoji
                    expect("®".containsEmoji).to(equal(.yes)) //emoji
                    expect("☁︎".containsEmoji).to(equal(.yes)) //emoji
                    expect("a😀".containsEmoji).to(equal(.yes))
                    expect("😀😀".containsEmoji).to(equal(.yes))
                    expect("😎".containsEmoji).to(equal(.yes))
                    expect("💤".containsEmoji).to(equal(.yes))
                    expect("💀".containsEmoji).to(equal(.yes))
                    expect("👻".containsEmoji).to(equal(.yes))
                    expect("👽".containsEmoji).to(equal(.yes))
                    expect("🤖".containsEmoji).to(equal(.yes))
                    expect("⛵️".containsEmoji).to(equal(.yes))
                    expect("🖇".containsEmoji).to(equal(.yes))
                    expect("🖐".containsEmoji).to(equal(.yes))
                    expect("🤐".containsEmoji).to(equal(.yes))
                    expect("🤘🏻".containsEmoji).to(equal(.yes))
                    expect("🦀".containsEmoji).to(equal(.yes))
                    expect("🦄".containsEmoji).to(equal(.yes))
                    expect("🧀".containsEmoji).to(equal(.yes))
                    expect("🖼".containsEmoji).to(equal(.yes))
                    expect("🗿".containsEmoji).to(equal(.yes))
                    expect("😺".containsEmoji).to(equal(.yes))
                    expect("👌".containsEmoji).to(equal(.yes))
                    expect("🖕🏻".containsEmoji).to(equal(.yes))
                    expect("👍🏻".containsEmoji).to(equal(.yes))
                    expect("⚡️".containsEmoji).to(equal(.yes))
                    expect("🤡".containsEmoji).to(equal(.yes))
                    expect("🥋".containsEmoji).to(equal(.yes))
                    expect("🤙".containsEmoji).to(equal(.yes))
                    expect("🤞".containsEmoji).to(equal(.yes))
                    expect("🤴".containsEmoji).to(equal(.yes))
                    expect("🥃".containsEmoji).to(equal(.yes))
                    expect("🥑".containsEmoji).to(equal(.yes))
                    expect("🦏".containsEmoji).to(equal(.yes))
                    expect("🤢".containsEmoji).to(equal(.yes))
                    expect("🛒".containsEmoji).to(equal(.yes))
                    expect("🛰".containsEmoji).to(equal(.yes))
                    expect("🛶".containsEmoji).to(equal(.yes))
                    expect("🦑".containsEmoji).to(equal(.yes))
                    expect("🤦".containsEmoji).to(equal(.yes))
                    expect("🧜‍♀️".containsEmoji).to(equal(.yes))
                    expect("🇮🇹".containsEmoji).to(equal(.yes))
                }
            }
        }
    }
    
}
