import TBLCategories
import Quick
import Nimble

class UIColorSpec: QuickSpec {

    override func spec() {
        describe("hex string") {
            it("should generate the correct value") {
                expect(UIColor.yellow.toHexString()).to(equal("FFFF00"))
                expect(UIColor(fromHexString: "16A085")?.toHexString()).to(equal("16A085"))
            }

            it("should handle 8 character codes") {
                expect(UIColor(fromHexString: "FFFF00FF")).to(equal(UIColor.yellow))
            }

            it("should return nil for invalid values") {
                expect(UIColor(fromHexString: "FFFFF")).to(beNil()) // only supports 6 or 8 character sequencs
                expect(UIColor(fromHexString: "*&$()&")).to(beNil())
                expect(UIColor(fromHexString: "GGGGGG")).to(beNil())
            }
        }
    }
    
}
