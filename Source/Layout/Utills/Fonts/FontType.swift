//
//  FontType.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation

enum FontType: String {
    case regularFont
    case italicFont
    case thinFont
    case thinItalicFont
    case lightFont
    case lightItalicFont
    case mediumFont
    case mediumItalicFont
    case boldFont
    case boldItalicFont
    case blackFont
    case blackItalicFont

    var name: String {
        switch self {
        case .regularFont:
            return  "Roboto-Regular"
        case .italicFont:
            return "Roboto-Italic"
        case .thinFont:
            return  "Roboto-Thin"
        case .thinItalicFont:
            return  "Roboto-ThinItalic"
        case .lightFont:
            return  "Roboto-Light"
        case .lightItalicFont:
            return  "Roboto-LightItalic"
        case .mediumFont:
            return  "Roboto-Medium"
        case .mediumItalicFont:
            return  "Roboto-MediumItalic"
        case .boldFont:
            return  "Roboto-Bold"
        case .boldItalicFont:
            return  "Roboto-BoldItalic"
        case .blackFont:
            return  "Roboto-Black"
        case .blackItalicFont:
            return  "Roboto-BlackItalic"
        }
    }
}
