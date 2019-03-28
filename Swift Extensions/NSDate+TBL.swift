import Foundation

let secondsInAMinute = Double(60)
let secondsInAnHour = 60 * secondsInAMinute
let secondsInADay = 24 * secondsInAnHour
let secondsInAWeek = 7 * secondsInADay
let secondsInAYear = 365 * secondsInADay

let minutesInAnHour = Double(60)
let minutesInADay = 24 * minutesInAnHour

@objc public extension NSDate {
    var isInThePast: Bool {
        return (self as Date).isInThePast
    }

    func timeAgo() -> String {
        return (self as Date).timeAgo()
    }

    func timeAgoWithSeconds() -> String {
        return (self as Date).timeAgoWithSeconds()
    }

    func timeAgoWithSeconds(_ withSeconds: Bool) -> String {
        return (self as Date).timeAgoWithSeconds(withSeconds)
    }

    func isAfter(_ otherDate: NSDate) -> Bool {
        return (self as Date).isAfter(otherDate as Date)
    }

    func isBefore(_ otherDate: NSDate) -> Bool {
        return (self as Date).isBefore(otherDate as Date)
    }

    func isBefore(daysAgo: Double) -> Bool {
        return (self as Date).isBefore(daysAgo: daysAgo)
    }

    func isAfter(daysAgo: Double) -> Bool {
        return (self as Date).isAfter(daysAgo: daysAgo)
    }

    func isBefore(hoursAgo: Double) -> Bool {
        return (self as Date).isBefore(hoursAgo: hoursAgo)
    }

    func isAfter(hoursAgo: Double) -> Bool {
        return (self as Date).isAfter(hoursAgo: hoursAgo)
    }

    func isBefore(minutesAgo: Double) -> Bool {
        return (self as Date).isBefore(minutesAgo: minutesAgo)
    }

    func isAfter(minutesAgo: Double) -> Bool {
        return (self as Date).isAfter(minutesAgo: minutesAgo)
    }

    func isBefore(secondsAgo: Double) -> Bool {
        return (self as Date).isBefore(secondsAgo: secondsAgo)
    }

    func isAfter(secondsAgo: Double) -> Bool {
        return (self as Date).isAfter(secondsAgo: secondsAgo)
    }

    func isToday() -> Bool {
        return (self as Date).isToday()
    }

    func isTomorrow() -> Bool {
        return (self as Date).isTomorrow()
    }
}

public extension Date {
    enum TimeAgoStyle {
        case short
        case long
    }

    private enum TimeAgo {
        case seconds(Int)
        case minutes(Int)
        case hours(Int)
        case days(Int)
        case weeks(Int)
        case years(Int)

        static let nowText = "now"

        func text(for style: TimeAgoStyle) -> String {
            switch style {
            case .short:
                switch self {
                case .seconds(let seconds):
                    if seconds == 0 {
                        return TimeAgo.nowText
                    } else {
                        return "\(seconds)s"
                    }
                case .minutes(let minutes):
                    if minutes == 0 {
                        return TimeAgo.nowText
                    } else {
                        return "\(minutes)m"
                    }
                case .hours(let hours):
                    return "\(hours)h"
                case .days(let days):
                    return "\(days)d"
                case .weeks(let weeks):
                    return "\(weeks)w"
                case .years(let years):
                    return "\(years)y"
                }
            case .long:
                let label: String
                let count: Int
                switch self {
                case .seconds(let seconds):
                    if seconds == 0 {
                        return TimeAgo.nowText
                    } else {
                        label = "second"
                        count = seconds
                    }
                case .minutes(let minutes):
                    if minutes == 0 {
                        return TimeAgo.nowText
                    } else {
                        label = "minute"
                        count = minutes
                    }
                case .hours(let hours):
                    label = "hour"
                    count = hours
                case .days(let days):
                    label = "day"
                    count = days
                case .weeks(let weeks):
                    label = "week"
                    count = weeks
                case .years(let years):
                    label = "year"
                    count = years
                }
                return "\(count) \(label)\(count != 1 ? "s" : "") ago"
            }
        }
    }

    var isInThePast: Bool {
        return timeIntervalSinceNow < 0
    }

    func timeAgo() -> String {
        return timeAgoWithSeconds(false)
    }

    func timeAgoWithSeconds() -> String {
        return timeAgoWithSeconds(true)
    }

    // TODO: add version with format specifier
    func timeAgoWithSeconds(_ withSeconds: Bool, style: TimeAgoStyle = .short) -> String {
        let now = Date()
        let timeAgo: TimeAgo
        let deltaSeconds: TimeInterval = now.timeIntervalSince(self)
        if (deltaSeconds <= 0) {
            timeAgo = (withSeconds ? .seconds(1) : .minutes(1)) // special case for clock wonkiness
        } else if (deltaSeconds < secondsInAMinute) {
            if (withSeconds) {
                let seconds = Int(floor(deltaSeconds))
                timeAgo = .seconds(seconds)
            } else {
                timeAgo = .minutes(0)
            }
        } else if (deltaSeconds < secondsInAnHour) {
            let minutes = Int(floor(deltaSeconds/secondsInAMinute))
            timeAgo = .minutes(minutes)
        } else if (deltaSeconds < secondsInADay) {
            let hours = Int(floor(deltaSeconds/secondsInAnHour))
            timeAgo = .hours(hours)
        } else if (deltaSeconds < secondsInAWeek) {
            let days = Int(floor(deltaSeconds/secondsInADay))
            timeAgo = .days(days)
        } else if (deltaSeconds < secondsInAYear) {
            let weeks = Int(floor(deltaSeconds/secondsInAWeek))
            timeAgo = .weeks(weeks)
        } else {
            let years = Int(floor(deltaSeconds/secondsInAYear))
            timeAgo = .years(years)
        }
        return timeAgo.text(for: style)
    }

    func isAfter(_ otherDate: Date) -> Bool {
        return compare(otherDate) == .orderedDescending
    }

    func isBefore(_ otherDate: Date) -> Bool {
        return compare(otherDate) == .orderedAscending
    }

    func isBefore(daysAgo: Double) -> Bool {
        return isBefore(minutesAgo: (daysAgo * minutesInADay))
    }

    func isAfter(daysAgo: Double) -> Bool {
        return isAfter(minutesAgo: (daysAgo * minutesInADay))
    }

    func isBefore(hoursAgo: Double) -> Bool {
        return isBefore(minutesAgo: (hoursAgo * minutesInAnHour))
    }

    func isAfter(hoursAgo: Double) -> Bool {
        return isAfter(minutesAgo: (hoursAgo * minutesInAnHour))
    }

    func isBefore(minutesAgo: Double) -> Bool {
        return timeIntervalSinceNow < inThePast(minutesAgo * secondsInAMinute)
    }

    func isAfter(minutesAgo: Double) -> Bool {
        return timeIntervalSinceNow > inThePast(minutesAgo * secondsInAMinute)
    }

    func isBefore(secondsAgo: Double) -> Bool {
        return timeIntervalSinceNow < inThePast(secondsAgo)
    }

    func isAfter(secondsAgo: Double) -> Bool {
        return timeIntervalSinceNow > inThePast(secondsAgo)
    }

    fileprivate func inThePast(_ seconds: Double) -> TimeInterval {
        return -seconds
    }

    func isToday() -> Bool {
        let calendar = Calendar.current
        let nowComponents = (calendar as NSCalendar).components(([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day]), from: Date())
        let selfComponents = (calendar as NSCalendar).components(([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day]), from:self)

        if let definitelyToday = calendar.date(from: nowComponents),
            let possiblyToday = calendar.date(from: selfComponents) {
                return (definitelyToday == possiblyToday)
        }

        // TODO return an enum with true/false/unknown instead?
        return false
    }

    func isTomorrow() -> Bool {
        let calendar = Calendar.current
        let nowComponents = (calendar as NSCalendar).components(([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day]), from: Date())
        let selfComponents = (calendar as NSCalendar).components(([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day]), from:self)

        if let definitelyToday = calendar.date(from: nowComponents),
            let possiblyTomorrow = calendar.date(from: selfComponents) {
                return possiblyTomorrow.timeIntervalSince(definitelyToday) == (60 * 60 * 24)
        }

        // TODO return an enum with true/false/unknown instead?
        return false
    }
}
