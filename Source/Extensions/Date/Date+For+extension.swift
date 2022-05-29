import Foundation

extension Date {
    // MARK: - Enum

    enum DateForType {
        case startOfDay, endOfDay, startOfWeek, endOfWeek, startOfMonth, endOfMonth, tomorrow, yesterday, nearestMinute(minute: Int), nearestHour(hour: Int)
    }

    // MARK: - Create dates for...

    func dateFor(type: DateForType, calendar: Calendar = Calendar.current) -> Date? {
        switch type {
        case .startOfDay:
            return adjust(hour: 0, minute: 0, second: 0)
        case .endOfDay:
            return adjust(hour: 23, minute: 59, second: 59)
        case .startOfWeek:
            let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? Date()
            return calendar.date(byAdding: .day, value: 1, to: sunday)
        case .endOfWeek:
            let sunday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? Date()
            return calendar.date(byAdding: .day, value: 7, to: sunday)
        case .startOfMonth:
            return adjust(hour: 0, minute: 0, second: 0, day: 1)
        case .endOfMonth:
            let month = (component(.month) ?? 0) + 1
            return adjust(hour: 0, minute: 0, second: 0, day: 0, month: month)
        case .tomorrow:
            return adjust(component: .day, offset: 1)
        case .yesterday:
            return adjust(component: .day, offset: -1)
        case let .nearestMinute(nearest):
            guard let minute = component(.minute) else {
                return nil
            }
            let minutes = (minute + nearest / 2) / nearest * nearest
            return adjust(hour: nil, minute: minutes, second: nil)
        case let .nearestHour(nearest):
            guard let hour = component(.hour) else {
                return nil
            }
            let hours = (hour + nearest / 2) / nearest * nearest
            return adjust(hour: hours, minute: 0, second: nil)
        }
    }
}
