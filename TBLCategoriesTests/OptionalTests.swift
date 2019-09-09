
import TBLCategories
import Quick
import Nimble

class OptionalTests: QuickSpec {

    override func spec() {
        describe("isEmpty") {
            it("should work on optional strings") {
                var foo: String? = nil
                expect(foo?.isEmpty).to(beNil())
                expect(foo.isEmpty).to(beTrue())
                foo = ""
                expect(foo.isEmpty).to(beTrue())
                foo = "bar"
                expect(foo.isEmpty).to(beFalse())
            }
            
            it("should work on optional arrays") {
                var foo: [String]? = nil
                expect(foo?.isEmpty).to(beNil())
                expect(foo.isEmpty).to(beTrue())
                foo = []
                expect(foo.isEmpty).to(beTrue())
                foo = [""]
                expect(foo.isEmpty).to(beFalse())
            }
            
            it("should work on optional dictionaries") {
                var foo: [String: String]? = nil
                expect(foo?.isEmpty).to(beNil())
                expect(foo.isEmpty).to(beTrue())
                foo = [:]
                expect(foo.isEmpty).to(beTrue())
                foo = ["" : ""]
                expect(foo.isEmpty).to(beFalse())
            }
        }
        
        describe("hasNonEmptyValue") {
            it("should work on optional strings") {
                var foo: String? = nil
                expect(foo?.hasNonEmptyValue).to(beNil())
                expect(foo.hasNonEmptyValue).to(beFalse())
                foo = ""
                expect(foo.hasNonEmptyValue).to(beFalse())
                foo = "bar"
                expect(foo.hasNonEmptyValue).to(beTrue())
            }
        }
    }
    
}
