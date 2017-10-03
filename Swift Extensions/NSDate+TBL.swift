import Foundation

let secondsInAMinute = Double(60)
let secondsInAnHour = 60 * secondsInAMinute
let secondsInADay = 24 * secondsInAnHour
let secondsInAWeek = 7 * secondsInADay
let secondsInAYear = 365 * secondsInADay

let minutesInAnHour = Double(60)
let minutesInADay = 24 * minutesInAnHour

@objc public extension NSDate {
    public var isInThePast: Bool {
        return (self as Date).isInThePast
    }

    public func timeAgo() -> String {
        return (self as Date).timeAgo()
    }

    public func timeAgoWithSeconds() -> String {
        return (self as Date).timeAgoWithSeconds()
    }

    public func timeAgoWithSeconds(_ withSeconds: Bool) -> String {
        return (self as Date).timeAgoWithSeconds(withSeconds)
    }

    public func isAfter(_ otherDate: NSDate) -> Bool {
        return (self as Date).isAfter(otherDate as Date)
    }

    public func isBefore(_ otherDate: NSDate) -> Bool {
        return (self as Date).isBefore(otherDate as Date)
    }

    public func isBefore(daysAgo: Double) -> Bool {
        return (self as Date).isBefore(daysAgo: daysAgo)
    }

    public func isAfter(daysAgo: Double) -> Bool {
        return (self as Date).isAfter(daysAgo: daysAgo)
    }

    public func isBefore(hoursAgo: Double) -> Bool {
        return (self as Date).isBefore(hoursAgo: hoursAgo)
    }

    public func isAfter(hoursAgo: Double) -> Bool {
        return (self as Date).isAfter(hoursAgo: hoursAgo)
    }

    public func isBefore(minutesAgo: Double) -> Bool {
        return (self as Date).isBefore(minutesAgo: minutesAgo)
    }

    public func isAfter(minutesAgo: Double) -> Bool {
        return (self as Date).isAfter(minutesAgo: minutesAgo)
    }

    public func isToday() -> Bool {
        return (self as Date).isToday()
    }

    public func isTomorrow() -> Bool {
        return (self as Date).isTomorrow()
    }
}

public extension Date {

    public var isInThePast: Bool {
        return timeIntervalSinceNow < 0
    }

    public func timeAgo() -> String {
        return timeAgoWithSeconds(false)
    }

    public func timeAgoWithSeconds() -> String {
        return timeAgoWithSeconds(true)
    }

    // TODO: add version with format specifier
    public func timeAgoWithSeconds(_ withSeconds: Bool) -> String {
        let now = Date()
        let deltaSeconds: TimeInterval = now.timeIntervalSince(self)
        if (deltaSeconds <= 0) {
            return (withSeconds ? "1s" : "1m") // special case for clock wonkiness
        } else if (deltaSeconds < secondsInAMinute) {
            if (withSeconds) {
                let seconds = Int(floor(deltaSeconds))
                return "\(seconds)s"
            } else {
                return "0m"
            }
        } else if (deltaSeconds < secondsInAnHour) {
            let minutes = Int(floor(deltaSeconds/secondsInAMinute))
            return "\(minutes)m"
        } else if (deltaSeconds < secondsInADay) {
            let hours = Int(floor(deltaSeconds/secondsInAnHour))
            return "\(hours)h"
        } else if (deltaSeconds < secondsInAWeek) {
            let days = Int(floor(deltaSeconds/secondsInADay))
            return "\(days)d"
        } else if (deltaSeconds < secondsInAYear) {
            let weeks = Int(floor(deltaSeconds/secondsInAWeek))
            return "\(weeks)w"
        } else {
            let years = Int(floor(deltaSeconds/secondsInAYear))
            return "\(years)y"
        }
    }

    public func isAfter(_ otherDate: Date) -> Bool {
        return compare(otherDate) == .orderedDescending
    }

    public func isBefore(_ otherDate: Date) -> Bool {
        return compare(otherDate) == .orderedAscending
    }

    public func isBefore(daysAgo: Double) -> Bool {
        return isBefore(minutesAgo: (daysAgo * minutesInADay))
    }

    public func isAfter(daysAgo: Double) -> Bool {
        return isAfter(minutesAgo: (daysAgo * minutesInADay))
    }

    public func isBefore(hoursAgo: Double) -> Bool {
        return isBefore(minutesAgo: (hoursAgo * minutesInAnHour))
    }

    public func isAfter(hoursAgo: Double) -> Bool {
        return isAfter(minutesAgo: (hoursAgo * minutesInAnHour))
    }

    public func isBefore(minutesAgo: Double) -> Bool {
        return timeIntervalSinceNow < inThePast(minutesAgo * secondsInAMinute)
    }

    public func isAfter(minutesAgo: Double) -> Bool {
        return timeIntervalSinceNow > inThePast(minutesAgo * secondsInAMinute)
    }

    fileprivate func inThePast(_ seconds: Double) -> TimeInterval {
        return -seconds
    }

    public func isToday() -> Bool {
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

    public func isTomorrow() -> Bool {
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
