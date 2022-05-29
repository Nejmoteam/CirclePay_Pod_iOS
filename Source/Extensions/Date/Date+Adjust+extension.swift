import Foundation

extension Date {
    // MARK: - Adjust Dates

    func adjust(component: DateComponentType, offset: Int, timeZone: TimeZoneType = .utc) -> Date? {
        var dateComp = DateComponents()
        switch component {
        case .second:
            dateComp.second = offset
        case .minute:
            dateComp.minute = offset
        case .hour:
            dateComp.hour = offset
        case .day:
            dateComp.day = offset
        case .weekday:
            dateComp.weekday = offset
        case .nthWeekday:
            dateComp.weekdayOrdinal = offset
        case .week:
            dateComp.weekOfYear = offset
        case .month:
            dateComp.month = offset
        case .year:
            dateComp.year = offset
        }
        var calendar = Calendar.current
        if let timeZone = timeZone.timeZone {
            calendar.timeZone = timeZone
        }
        return calendar.date(byAdding: dateComp, to: self)
    }

    func adjust(hour: Int? = nil, minute: Int? = nil, second: Int? = nil, day: Int? = nil, month: Int? = nil, timeZone: TimeZoneType = .utc) -> Date? {
        var comp = components(fromDate: self, timeZone: timeZone)
        comp.month = month ?? comp.month
        comp.day = day ?? comp.day
        comp.hour = hour ?? comp.hour
        comp.minute = minute ?? comp.minute
        comp.second = second ?? comp.second
        var calendar = Calendar.current
        if let timeZone = timeZone.timeZone {
            calendar.timeZone = timeZone
        }
        return calendar.date(from: comp)
    }

    func setDaylightSaving(cityIdentifier: String) -> Int {
        // Setting data hour to the current data hour to get the right offset with the changing of DST along different seasons.
        let currentDate = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)
        guard let timeZone = TimeZone(identifier: cityIdentifier), let date = Calendar.current.date(bySetting: .hour, value: hour, of: self) else {
            return 0
        }
        let timeOffset = timeZone.secondsFromGMT(for: date)
        return timeOffset
    }
}
