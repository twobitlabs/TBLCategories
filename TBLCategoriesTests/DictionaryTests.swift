import TBLCategories
import XCTest
import Nimble

class DictionaryTests : XCTestCase {
    func testBoolWithDefault() {
        let foo: [String: Any] = ["bar": false, "baz": "gee"]
        expect(foo[bool: "bar", default: true]).to(beFalse())
        expect(foo[bool: "bar", default: false]).to(beFalse())

        // key doesn't exist
        expect(foo[bool: "foo", default: true]).to(beTrue())
        expect(foo[bool: "foo", default: false]).to(beFalse())

        // key exists, isn't a bool
        expect(foo[bool: "baz", default: true]).to(beTrue())
        expect(foo[bool: "baz", default: false]).to(beFalse())
    }
}
