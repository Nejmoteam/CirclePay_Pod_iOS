//
//  Date.swift
//  Nejmo
//
//  Created by Alchemist on 23/02/2021.
//  Copyright © 2021 Nejmo. All rights reserved.
//
// swiftlint:disable large_tuple
import Foundation
extension Date {
    func string(format: DateFormats) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }

    static func - (recent: Date, previous: Date) -> (month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

        return (month: month, day: day, hour: hour, minute: minute, second: second)
    }
}

enum DateFormats: String {
    case MM_dd_yyyy = "MM/dd/yyyy" // 10/21/2017
    case MM_dd_yyyy_HH_mm = "MM-dd-yyyy HH:mm" // 10-21-2017 03:31
    case EEEE_MMM_d_yyyy = "EEEE, MMM d, yyyy" // Saturday, Oct 21, 2017
    case MMM_d_h_mm_a = "MMM d, h:mm a" // Oct 21, 3:31 AM
    case MMMM_yyyy = "MMMM yyyy" // October 2017
    case E_d_MMM_yyyy_HH_mm_ss_Z = "E, d MMM yyyy HH:mm:ss Z" // Sat, 21 Oct 2017 03:31:40 +0000
    case yyyy_MM_dd_T_HH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ" // 2017-10-21T03:31:40+0000
    case dd_mm_yyyy = "dd/MM/yyyy" // 21.10.17
}
