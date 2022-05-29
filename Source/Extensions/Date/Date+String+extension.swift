import Foundation

extension Date {
    // MARK: - Enums

    enum RelativeTimeStringType {
        case nowPast, nowFuture, secondsPast, secondsFuture, oneMinutePast, oneMinuteFuture, minutesPast, minutesFuture, oneHourPast, oneHourFuture, hoursPast, hoursFuture, oneDayPast, oneDayFuture, daysPast, daysFuture, oneWeekPast, oneWeekFuture, weeksPast, weeksFuture, oneMonthPast, oneMonthFuture, monthsPast, monthsFuture, oneYearPast, oneYearFuture, yearsPast, yearsFuture
    }

    enum DateFormatType {
        /// The ISO8601 formatted year "yyyy" i.e. 1997
        case isoYear

        /// The ISO8601 formatted year and month "yyyy-MM" i.e. 1997-07
        case isoYearMonth

        /// The ISO8601 formatted date "yyyy-MM-dd" i.e. 1997-07-16
        case isoDate

        /// The ISO8601 formatted date and time "yyyy-MM-dd'T'HH:mmZ" i.e. 1997-07-16T19:20+01:00
        case isoDateTime

        /// The ISO8601 formatted date, time and sec "yyyy-MM-dd'T'HH:mm:ssZ" i.e. 1997-07-16T19:20:30+01:00
        case isoDateTimeSec

        /// The ISO8601 formatted date, time and millisec "yyyy-MM-dd'T'HH:mm:ss.SSSZ" i.e. 1997-07-16T19:20:30.45+01:00
        case isoDateTimeMilliSec

        /// The dotNet formatted date "/Date(%d%d)/" i.e. "/Date(1268123281843)/"
        case dotNet

        /// The RSS formatted date "EEE, d MMM yyyy HH:mm:ss ZZZ" i.e. "Fri, 09 Sep 2011 15:26:08 +0200"
        case rss

        /// The Alternative RSS formatted date "d MMM yyyy HH:mm:ss ZZZ" i.e. "09 Sep 2011 15:26:08 +0200"
        case altRSS

        /// The http header formatted date "EEE, dd MM yyyy HH:mm:ss ZZZ" i.e. "Tue, 15 Nov 1994 12:45:26 GMT"
        case httpHeader

        /// A generic standard format date i.e. "EEE MMM dd HH:mm:ss Z yyyy"
        case standard

        /// A custom date format string
        case custom(String)

        var stringFormat: String {
            switch self {
            case .isoYear: return "yyyy"
            case .isoYearMonth: return "yyyy-MM"
            case .isoDate: return "yyyy-MM-dd"
            case .isoDateTime: return "yyyy-MM-dd'T'HH:mmZ"
            case .isoDateTimeSec: return "yyyy-MM-dd'T'HH:mm:ssZ"
            case .isoDateTimeMilliSec: return "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            case .dotNet: return "/Date(%d%f)/"
            case .rss: return "EEE, d MMM yyyy HH:mm:ss ZZZ"
            case .altRSS: return "d MMM yyyy HH:mm:ss ZZZ"
            case .httpHeader: return "EEE, dd MM yyyy HH:mm:ss ZZZ"
            case .standard: return "EEE MMM dd HH:mm:ss Z yyyy"
            case let .custom(customFormat): return customFormat
            }
        }
    }

    enum SeparatorStyle {
        case dot, comma, slash, dash, custom(String)

        var style: String {
            switch self {
            case .dot: return "."
            case .comma: return ","
            case .slash: return "/"
            case .dash: return "-"
            case let .custom(customStyle): return customStyle
            }
        }
    }

    enum DayFormat {
        case dayNumberFormat(DayNumberFormat), dayNameFormat(DayNameFormat), dayNumberAndNameFormat(DayNumberFormat, DayNameFormat, SeparatorStyle), dayNameAndNumberFormat(DayNameFormat, DayNumberFormat, SeparatorStyle), custom(String)

        var format: String {
            switch self {
            case let .dayNumberAndNameFormat(numberFormat, dayFormat, separator): return numberFormat.format + separator.style + dayFormat.format
            case let .dayNameAndNumberFormat(dayFormat, numberFormat, separator): return dayFormat.format + separator.style + numberFormat.format
            case let .dayNumberFormat(numberFormat): return numberFormat.format
            case let .dayNameFormat(dayFormat): return dayFormat.format
            case let .custom(customFormat): return customFormat
            }
        }
    }

    enum DayNameFormat {
        case short, medium, long, full

        var format: String {
            switch self {
            case .short: return "EEEEE" // T
            case .medium: return "EEEEEE" // Tu
            case .long: return "EEEE" // Tuesday
            case .full: return "EEE" // Tue
            }
        }
    }

    enum DayNumberFormat {
        case short, full

        var format: String {
            switch self {
            case .short: return "d" // 7
            case .full: return "dd" // 07
            }
        }
    }

    enum MonthFormat {
        case monthNumberFormat(MonthNumberFormat), monthNameFormat(MonthNameFormat), monthNumberAndNameFormat(MonthNumberFormat, MonthNameFormat, SeparatorStyle), monthNameAndNumberFormat(MonthNameFormat, MonthNumberFormat, SeparatorStyle), custom(String)

        var format: String {
            switch self {
            case let .monthNumberAndNameFormat(numberFormat, monthFormat, separator): return numberFormat.format + separator.style + monthFormat.format
            case let .monthNameAndNumberFormat(monthFormat, numberFormat, separator): return monthFormat.format + separator.style + numberFormat.format
            case let .monthNumberFormat(numberFormat): return numberFormat.format
            case let .monthNameFormat(dayFormat): return dayFormat.format
            case let .custom(customFormat): return customFormat
            }
        }
    }

    enum MonthNameFormat {
        case short, medium, full

        var format: String {
            switch self {
            case .short: return "MMMMM"
            case .medium: return "MMM"
            case .full: return "MMMM"
            }
        }
    }

    enum MonthNumberFormat {
        case short, full

        var format: String {
            switch self {
            case .short: return "M"
            case .full: return "MM"
            }
        }
    }

    enum YearNumberFormat {
        case short, full

        var format: String {
            switch self {
            case .short: return "yy"
            case .full: return "yyyy"
            }
        }
    }

    // MARK: - Convert to string

    func toString(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style, doesRelativeDateFormatting: Bool = false, timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.doesRelativeDateFormatting = doesRelativeDateFormatting
        formatter.timeZone = timeZone.timeZone
        formatter.locale = locale
        return formatter.string(from: self)
    }

    func toString(format: DateFormatType = .isoDate, timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.stringFormat
        formatter.timeZone = timeZone.timeZone
        formatter.locale = locale
        return formatter.string(from: self)
    }

    func toString(format: DateFormatType = .isoDate, timeStyle: DateFormatter.Style, timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.stringFormat
        formatter.timeStyle = timeStyle
        formatter.timeZone = timeZone.timeZone
        formatter.locale = locale
        return formatter.string(from: self)
    }

    // MARK: - Extracting Day

    func day(format: DayFormat = .dayNumberAndNameFormat(.full, .full, .dot), timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> String {
        toString(format: .custom(format.format), timeZone: timeZone, locale: locale)
    }

    func daySuffix(timeZone: TimeZoneType = .utc) -> String {
        guard let dayOfMonth = self.component(.day, timeZone: timeZone) else {
            return ""
        }
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }

    // MARK: - Extracting Month

    func month(format: MonthFormat = .monthNumberAndNameFormat(.full, .full, .dot), timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> String {
        toString(format: .custom(format.format), timeZone: timeZone, locale: locale)
    }

    // MARK: - Extracting Year

    func yearhNumber(format: YearNumberFormat = .full, timeZone: TimeZoneType = .utc, locale: Locale = Locale.current) -> String {
        toString(format: .custom(format.format), timeZone: timeZone, locale: locale)
    }
}
