import TBLCategories
import XCTest
import Nimble

class NSDateTests : XCTestCase {

    func testDateComparison() {
        let now = Date()
        let tomorrow = now.addingTimeInterval(60 * 60 * 24)
        let yesterday = now.addingTimeInterval(-1 * 60 * 60 * 24)

        expect(now.isAfter(yesterday)).to(beTruthy())
        expect(now.isBefore(yesterday)).to(beFalsy())
        expect(now.isAfter(tomorrow)).to(beFalsy())
        expect(now.isBefore(tomorrow)).to(beTruthy())

        expect(now.isAfter(daysAgo: 1)).to(beTruthy())
        expect(now.isAfter(daysAgo: -1)).to(beFalsy())
        expect(yesterday.isAfter(daysAgo: 0)).to(beFalsy())
        expect(yesterday.isAfter(daysAgo: 2)).to(beTruthy())
        expect(tomorrow.isAfter(daysAgo: -2)).to(beFalsy())
        expect(tomorrow.isAfter(daysAgo: 0)).to(beTruthy())

        expect(now.isBefore(daysAgo: -1)).to(beTruthy())
        expect(now.isBefore(daysAgo: 1)).to(beFalsy())
        expect(yesterday.isBefore(daysAgo: 2)).to(beFalsy())
        expect(yesterday.isBefore(daysAgo: 0)).to(beTruthy())
        expect(tomorrow.isBefore(daysAgo: -2)).to(beTruthy())
        expect(tomorrow.isBefore(daysAgo: 0)).to(beFalsy())

        let threeHoursAgo = now.addingTimeInterval(-(60 * 60 * 3))

        expect(threeHoursAgo.isAfter(hoursAgo: 4)).to(beTruthy())
        expect(threeHoursAgo.isAfter(hoursAgo: 2)).to(beFalsy())
        expect(threeHoursAgo.isBefore(hoursAgo: 2)).to(beTruthy())
        expect(threeHoursAgo.isBefore(hoursAgo: 4)).to(beFalsy())

        let fiveMinutesAgo = now.addingTimeInterval(-(5 * 60))

        expect(fiveMinutesAgo.isAfter(minutesAgo: 6)).to(beTruthy())
        expect(fiveMinutesAgo.isAfter(minutesAgo: 4)).to(beFalsy())
        expect(fiveMinutesAgo.isBefore(minutesAgo: 4)).to(beTruthy())
        expect(fiveMinutesAgo.isBefore(minutesAgo: 6)).to(beFalsy())

        expect(now.isToday()).to(beTruthy())
        expect(now.isTomorrow()).to(beFalsy())
        expect(tomorrow.isToday()).to(beFalsy())
        expect(tomorrow.isTomorrow()).to(beTruthy())
        expect(yesterday.isToday()).to(beFalsy())
        expect(yesterday.isTomorrow()).to(beFalsy())

        expect(now.timeAgo()).to(equal("0m"))
        expect(tomorrow.timeAgo()).to(equal("1m")) // we assume future times are very recent
        expect(yesterday.timeAgo()).to(equal("1d"))
        expect(fiveMinutesAgo.timeAgo()).to(equal("5m"))
        expect(threeHoursAgo.timeAgo()).to(equal("3h"))
    }
}
