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

        expect(now.timeAgo()).to(equal("now"))
        expect(tomorrow.timeAgo()).to(equal("1m")) // we assume future times are very recent
        expect(yesterday.timeAgo()).to(equal("1d"))
        expect(fiveMinutesAgo.timeAgo()).to(equal("5m"))
        expect(threeHoursAgo.timeAgo()).to(equal("3h"))

        let fourDaysAgo = now.addingTimeInterval(-(60 * 60 * 24 * 4))
        expect(fourDaysAgo.timeAgo()).to(equal("4d"))

        let elevenWeeksAgo = now.addingTimeInterval(-(60 * 60 * 24 * 7 * 11))
        expect(elevenWeeksAgo.timeAgo()).to(equal("11w"))

        let twoYearsAgo = now.addingTimeInterval(-(60 * 60 * 24 * 365 * 2))
        expect(twoYearsAgo.timeAgo()).to(equal("2y"))

        expect(now.timeAgoWithSeconds(false, style: .short)).to(equal("now"))
        expect(tomorrow.timeAgoWithSeconds(false, style: .short)).to(equal("1m")) // we assume future times are very recent
        expect(yesterday.timeAgoWithSeconds(false, style: .short)).to(equal("1d"))
        expect(fiveMinutesAgo.timeAgoWithSeconds(false, style: .short)).to(equal("5m"))
        expect(threeHoursAgo.timeAgoWithSeconds(false, style: .short)).to(equal("3h"))
        expect(fourDaysAgo.timeAgoWithSeconds(false, style: .short)).to(equal("4d"))
        expect(elevenWeeksAgo.timeAgoWithSeconds(false, style: .short)).to(equal("11w"))
        expect(twoYearsAgo.timeAgoWithSeconds(false, style: .short)).to(equal("2y"))

        expect(now.timeAgoWithSeconds(true, style: .short)).to(equal("now"))
        expect(tomorrow.timeAgoWithSeconds(true, style: .short)).to(equal("1s")) // we assume future times are very recent
        expect(yesterday.timeAgoWithSeconds(true, style: .short)).to(equal("1d"))
        expect(fiveMinutesAgo.timeAgoWithSeconds(true, style: .short)).to(equal("5m"))
        expect(threeHoursAgo.timeAgoWithSeconds(true, style: .short)).to(equal("3h"))
        expect(fourDaysAgo.timeAgoWithSeconds(true, style: .short)).to(equal("4d"))
        expect(elevenWeeksAgo.timeAgoWithSeconds(true, style: .short)).to(equal("11w"))
        expect(twoYearsAgo.timeAgoWithSeconds(true, style: .short)).to(equal("2y"))

        expect(now.timeAgoWithSeconds(false, style: .long)).to(equal("now"))
        expect(tomorrow.timeAgoWithSeconds(false, style: .long)).to(equal("1 minute ago")) // we assume future times are very recent
        expect(yesterday.timeAgoWithSeconds(false, style: .long)).to(equal("1 day ago"))
        expect(fiveMinutesAgo.timeAgoWithSeconds(false, style: .long)).to(equal("5 minutes ago"))
        expect(threeHoursAgo.timeAgoWithSeconds(false, style: .long)).to(equal("3 hours ago"))
        expect(fourDaysAgo.timeAgoWithSeconds(false, style: .long)).to(equal("4 days ago"))
        expect(elevenWeeksAgo.timeAgoWithSeconds(false, style: .long)).to(equal("11 weeks ago"))
        expect(twoYearsAgo.timeAgoWithSeconds(false, style: .long)).to(equal("2 years ago"))

        expect(now.timeAgoWithSeconds(true, style: .long)).to(equal("now"))
        expect(tomorrow.timeAgoWithSeconds(true, style: .long)).to(equal("1 second ago")) // we assume future times are very recent
        expect(yesterday.timeAgoWithSeconds(true, style: .long)).to(equal("1 day ago"))
        expect(fiveMinutesAgo.timeAgoWithSeconds(true, style: .long)).to(equal("5 minutes ago"))
        expect(threeHoursAgo.timeAgoWithSeconds(true, style: .long)).to(equal("3 hours ago"))
        expect(fourDaysAgo.timeAgoWithSeconds(true, style: .long)).to(equal("4 days ago"))
        expect(elevenWeeksAgo.timeAgoWithSeconds(true, style: .long)).to(equal("11 weeks ago"))
        expect(twoYearsAgo.timeAgoWithSeconds(true, style: .long)).to(equal("2 years ago"))
    }
}
