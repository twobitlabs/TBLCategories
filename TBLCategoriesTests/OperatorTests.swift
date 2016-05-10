
import TBLCategories
import Quick
import Nimble

class GameScoreTests: QuickSpec {

    override func spec() {
        let bar = "bar"

        describe("nial coalesce operator") {
            it("should overwite if left side is nil") {
                var foo: String? = nil
                foo ??= bar
                expect(foo).to(equal(bar))
            }

            it("should not overwrite if left side is not nil") {
        left ??= right
                var foo: String? = "foo"

                foo ??= bar
                expect(foo).to(equal("foo"))

                foo ??= nil
                expect(foo).to(equal("foo"))
            }
        }
    }

}
