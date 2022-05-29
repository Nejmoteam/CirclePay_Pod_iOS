import Foundation
extension Date {
    // MARK: - Enums

    enum DateComponentType {
        case second, minute, hour, day, weekday, nthWeekday, week, month, year
    }

    // MARK: - Extracting components

    func component(_ component: DateComponentType, timeZone: TimeZoneType = .utc) -> Int? {
        let dateComponents = components(fromDate: self, timeZone: timeZone)
        switch component {
        case .second:
            return dateComponents.second
        case .minute:
            return dateComponents.minute
        case .hour:
            return dateComponents.hour
        case .day:
            return dateComponents.day
        case .weekday:
            return dateComponents.weekday
        case .nthWeekday:
            return dateComponents.weekdayOrdinal
        case .week:
            return dateComponents.weekOfYear
        case .month:
            return dateComponents.month
        case .year:
            return dateComponents.year
        }
    }

    func components(fromDate: Date, timeZone: TimeZoneType = .utc) -> DateComponents {
        var calendar = Calendar.current
        if let timeZone = timeZone.timeZone {
            calendar.timeZone = timeZone
        }
        return calendar.dateComponents(componentFlags(), from: fromDate)
    }

    private func componentFlags() -> Set<Calendar.Component> {
        [Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.weekOfYear, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second, Calendar.Component.weekday, Calendar.Component.weekdayOrdinal, Calendar.Component.weekOfYear]
    }

    func numberOfDaysInMonth() -> Int? {
        guard let range = Calendar.current.range(of: Calendar.Component.day, in: Calendar.Component.month, for: self) else {
            return 0
        }
        return range.upperBound - range.lowerBound
    }

    func firstDayOfMonth() -> Date? {
        Calendar(identifier: .gregorian).date(from:
            Calendar.current.dateComponents([.year, .month], from: self))
    }

    func startOfWeek(timeZone: TimeZoneType = .gmt) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = timeZone.timeZone ?? NSTimeZone.default
        let components: DateComponents? = calendar.dateComponents([.weekday, .year, .month, .day], from: self)
        guard var modifiedComponent = components else {
            return nil
        }
        modifiedComponent.day = (components?.day ?? 0) - ((components?.weekday ?? 0) - 1)
        return calendar.date(from: modifiedComponent)
    }

    func startOfMonth(timeZone: TimeZoneType = .gmt) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = timeZone.timeZone ?? NSTimeZone.default
        return calendar.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))
    }

    func endOfMonth(timeZone: TimeZoneType = .gmt) -> Date? {
        guard let startMonth = startOfMonth() else {
            return nil
        }
        var calendar = Calendar.current
        calendar.timeZone = timeZone.timeZone ?? NSTimeZone.default
        return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startMonth)
    }

    func nextMonth(timeZone: TimeZoneType = .gmt) -> Date? {
        guard let startMonth = startOfMonth() else {
            return nil
        }
        var calendar = Calendar.current
        calendar.timeZone = timeZone.timeZone ?? NSTimeZone.default
        return calendar.date(byAdding: DateComponents(month: 1, day: 0), to: startMonth)
    }

    func next60Days(timeZone: TimeZoneType = .gmt) -> Date? {
        guard let startMonth = startOfMonth() else {
            return nil
        }
        var calendar = Calendar.current
        calendar.timeZone = timeZone.timeZone ?? NSTimeZone.default
        return calendar.date(byAdding: DateComponents(month: 2, day: -1), to: startMonth)
    }

    func nextTwoMonth(timeZone: TimeZoneType = .gmt) -> Date? {
        guard let startMonth = startOfMonth(timeZone: timeZone) else {
            return nil
        }
        var calendar = Calendar.current
        calendar.timeZone = timeZone.timeZone ?? NSTimeZone.default
        return calendar.date(byAdding: DateComponents(month: 2, day: -1), to: startMonth)
    }

    func getAllDaysOfMonth() -> [Date] {
        var days = [Date]()

        let calendar = Calendar(identifier: .gregorian)

        guard let range = calendar.range(of: .day, in: .month, for: self) else {
            return []
        }

        guard var day = firstDayOfMonth() else {
            return []
        }
        var date: Date = day
        let timezone = TimeZone.current
        date.addTimeInterval(TimeInterval(timezone.secondsFromGMT(for: self)))
        day = date

        for _ in 1 ... range.count {
            days.append(day)
            day.addDays(count: 1)
        }

        return days
    }

    mutating func addDays(count: Int) {
        let cal = Calendar(identifier: .gregorian)
        guard let date = cal.date(byAdding: .day, value: count, to: self) else {
            return
        }
        self = date
    }

    func daysOfThreeMonths() -> [Date] {
        let nextMonth = Calendar(identifier: .gregorian).date(byAdding: .month, value: 1, to: self)
        let previousMonth = Calendar(identifier: .gregorian).date(byAdding: .month, value: -1, to: self)
        var daysOf3Months = [Date]()
        guard let perviousMonths = previousMonth?.getAllDaysOfMonth(), let nextMonths = nextMonth?.getAllDaysOfMonth() else {
            return []
        }
        daysOf3Months += perviousMonths
        daysOf3Months += getAllDaysOfMonth()
        daysOf3Months += nextMonths
        return daysOf3Months
    }
}
