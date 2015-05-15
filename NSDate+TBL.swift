
extension NSDate {

    func timeAgo() -> String {
        return timeAgoWithSeconds(false)
    }

    func timeAgoWithSeconds() -> String {
        return timeAgoWithSeconds(true)
    }

    // TODO: add version with format specifier
    func timeAgoWithSeconds(withSeconds: Bool) -> String {
        let now = NSDate()
        let deltaSeconds: NSTimeInterval = now.timeIntervalSinceDate(self)
        if (deltaSeconds <= 0) {
            return (withSeconds ? "1s" : "1m") // special case for clock wonkiness
        } else if (deltaSeconds < 60) {
            if (withSeconds) {
                return "\(deltaSeconds)s"
            } else {
                return "0m"
            }
        } else if (deltaSeconds < (60 * 60)) {
            let minutes = Int(floor(deltaSeconds/60))
            return "\(minutes)m"
        } else if (deltaSeconds < (24 * 60 * 60)) {
            let hours = Int(floor(deltaSeconds/(60 * 60)))
            return "\(hours)h"
        } else if (deltaSeconds < (7 * 24 * 60 * 60)) {
            let days = Int(floor(deltaSeconds/(24 * 60 * 60)))
            return "\(days)d"
        } else {
            let weeks = Int(floor(deltaSeconds/(7 * 24 * 60 * 60)))
            return "\(weeks)w"
        }
    }

    func isNewerThan(date: NSDate) -> Bool {
        return compare(date) == .OrderedDescending
    }

    func isOlderThan(date: NSDate) -> Bool {
        return compare(date) == .OrderedAscending
    }

    func isBefore(#daysAgo: Int) -> Bool {
        return isBefore(minutesAgo: (daysAgo * 24 * 60))
    }

    func isAfter(#daysAgo: Int) -> Bool {
        return isAfter(minutesAgo: (daysAgo * 24 * 60))
    }

    func isBefore(#hoursAgo: Int) -> Bool {
        return isBefore(minutesAgo: (hoursAgo * 60))
    }

    func isAfter(#hoursAgo: Int) -> Bool {
        return isAfter(minutesAgo: (hoursAgo * 60))
    }

    func isBefore(#minutesAgo: Int) -> Bool {
        return timeIntervalSinceNow < NSTimeInterval(minutesAgo * 60)
    }

    func isAfter(#minutesAgo: Int) -> Bool {
        return timeIntervalSinceNow > NSTimeInterval(minutesAgo * 60)
    }

    func isToday() -> Bool {
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

    func isTomorrow() -> Bool {
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