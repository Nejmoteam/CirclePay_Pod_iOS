import Foundation

extension Date {
    // MARK: - Convert to date

    func toDate(dateFormat: DateFormatType = .custom("dd-MM-yyyy hh:mm a"), timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> Date? {
        let dateString = self.toString(format: dateFormat, timeZone: timeZone, locale: locale)
        return dateString.toDate(format: dateFormat, timeZone: timeZone, locale: locale)
    }
}
