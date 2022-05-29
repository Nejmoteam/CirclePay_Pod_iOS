import Foundation

extension String {
    // MARK: - Convert from string

    func toDate(format: Date.DateFormatType = .isoDate, timeZone: Date.TimeZoneType = .utc, locale: Locale = Locale.current) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.stringFormat
        formatter.timeZone = timeZone.timeZone
        formatter.locale = locale
        return formatter.date(from: self)
    }

    func toDate(timeFormat: String, dateFromat: Date.DateFormatType? = nil, defaultDate: Date = Date(), timeZone: Date.TimeZoneType = .utc, locale: Locale = Locale.current) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat
        formatter.timeZone = timeZone.timeZone
        formatter.locale = locale

        var calendar = Calendar.current
        if let timeZone = timeZone.timeZone {
            calendar.timeZone = timeZone
        }

        guard let timeDate: Date = formatter.date(from: self),
              let hour: Int = timeDate.component(.hour, timeZone: timeZone), let minute: Int = timeDate.component(.minute, timeZone: timeZone),
              let date = calendar.date(bySettingHour: hour, minute: minute, second: 0, of: defaultDate)
        else {
            return nil
        }

        if let dateFromat = dateFromat {
            formatter.dateFormat = dateFromat.stringFormat
            let newDateString = formatter.string(from: defaultDate)
            return formatter.date(from: newDateString)
        }
        return date
    }
}
