import TBLCategories
import XCTest

class StringTests: XCTestCase {

    func testContains() {
        XCTAssertTrue("foot".contains("f"))
        XCTAssertTrue("foot".contains("oo"))
        XCTAssertTrue("foot".contains("t"))
        XCTAssertTrue("foot".contains("foo"))
        XCTAssertTrue("foot".contains("foot"))

        XCTAssertFalse("foot".contains(""))
        XCTAssertFalse("foot".contains("FOOT"))
    }


}
