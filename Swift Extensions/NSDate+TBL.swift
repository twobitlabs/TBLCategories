
let secondsInAMinute = Double(60)
let secondsInAnHour = 60 * secondsInAMinute
let secondsInADay = 24 * secondsInAnHour
let secondsInAWeek = 7 * secondsInADay
let secondsInAYear = 365 * secondsInADay

let minutesInAnHour = Double(60)
let minutesInADay = 24 * minutesInAnHour

public extension NSDate {

    public func timeAgo() -> String {
        return timeAgoWithSeconds(false)
    }

    public func timeAgoWithSeconds() -> String {
        return timeAgoWithSeconds(true)
    }

    // TODO: add version with format specifier
    public func timeAgoWithSeconds(withSeconds: Bool) -> String {
        let now = NSDate()
        let deltaSeconds: NSTimeInterval = now.timeIntervalSinceDate(self)
        if (deltaSeconds <= 0) {
            return (withSeconds ? "1s" : "1m") // special case for clock wonkiness
        } else if (deltaSeconds < secondsInAMinute) {
            if (withSeconds) {
                return "\(deltaSeconds)s"
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

    public func isAfter(otherDate: NSDate) -> Bool {
        return compare(otherDate) == .OrderedDescending
    }

    public func isBefore(otherDate: NSDate) -> Bool {
        return compare(otherDate) == .OrderedAscending
    }

    public func isBefore(#daysAgo: Double) -> Bool {
        return isBefore(minutesAgo: (daysAgo * minutesInADay))
    }

    public func isAfter(#daysAgo: Double) -> Bool {
        return isAfter(minutesAgo: (daysAgo * minutesInADay))
    }

    public func isBefore(#hoursAgo: Double) -> Bool {
        return isBefore(minutesAgo: (hoursAgo * minutesInAnHour))
    }

    public func isAfter(#hoursAgo: Double) -> Bool {
        return isAfter(minutesAgo: (hoursAgo * minutesInAnHour))
    }

    public func isBefore(#minutesAgo: Double) -> Bool {
        return timeIntervalSinceNow < inThePast(minutesAgo * secondsInAMinute)
    }

    public func isAfter(#minutesAgo: Double) -> Bool {
        return timeIntervalSinceNow > inThePast(minutesAgo * secondsInAMinute)
    }

    private func inThePast(seconds: Double) -> NSTimeInterval {
        return -seconds
    }

    public func isToday() -> Bool {
        let calendar = NSCalendar.currentCalendar()
        let nowComponents = calendar.components((NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay), fromDate: NSDate())
        let selfComponents = calendar.components((NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay), fromDate:self)

        if let definitelyToday = calendar.dateFromComponents(nowComponents),
            possiblyToday = calendar.dateFromComponents(selfComponents) {
                return definitelyToday.isEqualToDate(possiblyToday)
        }

        // TODO return an enum with true/false/unknown instead?
        return false
    }

    public func isTomorrow() -> Bool {
        let calendar = NSCalendar.currentCalendar()
        let nowComponents = calendar.components((NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay), fromDate: NSDate())
        let selfComponents = calendar.components((NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay), fromDate:self)

        if let definitelyToday = calendar.dateFromComponents(nowComponents),
            possiblyTomorrow = calendar.dateFromComponents(selfComponents) {
                return possiblyTomorrow.timeIntervalSinceDate(definitelyToday) == (60 * 60 * 24)
        }

        // TODO return an enum with true/false/unknown instead?
        return false
    }
}