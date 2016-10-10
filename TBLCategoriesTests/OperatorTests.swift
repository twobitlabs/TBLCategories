
import TBLCategories
import XCTest

class OperatorTests: XCTestCase {

    func testNilCoalesceAndAssign() {
        var left: String?
        var right: String?

        left ??= right
        XCTAssertEqual(left, nil, "Should not reassign left if right is nil")

        right = "right"
        left ??= right
        XCTAssertEqual(left, "right", "Should reassign left if left is nil and right is not")

        right = "foo"
        left ??= right
        XCTAssertEqual(left, "right", "Should not reassign left if left is not nil")

        right = nil
        left ??= right
        XCTAssertEqual(left, "right", "Should not reassign left if left is not nil")
    }

}
