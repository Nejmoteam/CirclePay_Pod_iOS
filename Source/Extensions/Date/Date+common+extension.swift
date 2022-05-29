import Foundation

extension Date {
    // MARK: Enums

    enum TimeZoneType {
        case none, defaultValue, local, utc, gmt, identifier(String), abbreviation(String)

        var timeZone: TimeZone? {
            switch self {
            case .none: return nil
            case .defaultValue: return NSTimeZone.default
            case .local: return NSTimeZone.local
            case .utc: return TimeZone(identifier: "UTC")
            case .gmt: return TimeZone(identifier: "GMT")
            case let .identifier(identifierString): return TimeZone(identifier: identifierString)
            case let .abbreviation(abbreviationString): return TimeZone(abbreviation: abbreviationString)
//            case let .custom(gmt): return TimeZone(secondsFromGMT: gmt)
            }
        }
    }
}
