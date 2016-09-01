
import TBLCategories
import XCTest

class OperatorTests: XCTestCase {

    func testNilCoalesceAndAssign() {
        var left: String? = "left"
        var right: String?

        left ??= right
        XCTAssertEqual(left, "left", "Should not reassign left if right is nil")

        right = "right"
        left ??= right
        XCTAssertEqual(left, "right", "Should reassign left if right is not nil")
    }

}
