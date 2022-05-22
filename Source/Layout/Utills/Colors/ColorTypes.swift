//
//  NejmoColors.swift
//  Nejmo
//
//  Created by Alchemist on 14/02/2021.
//  Copyright © 2021 Nejmo. All rights reserved.
//

import Foundation
import UIKit

enum ColorTypes {
    case MobilePrimary700
    case MobilePrimary600
    case MobilePrimary400
    case MobilePrimary300
    case MobilePrimary200
    case MobilePrimary100
    case MobilePrimary0

    case PrimaryMain200
    case PrimaryMain300
    case PrimaryMain400
    case PrimaryMain500
    case PrimaryMain700

    case Success200
    case Success300
    case Success400
    case Success500
    case Success700

    case Warning200
    case Warning300
    case Warning400
    case Warning500
    case Warning700

    case Error200
    case Error300
    case Error400
    case Error500
    case Error700

    case GrayPrimary0
    case GrayPrimary100
    case GrayPrimary200
    case GrayPrimary300
    case GrayPrimary400
    case GrayPrimary500
    case GrayPrimary600
    case GrayPrimary700
    case GrayPrimary800
    case GrayPrimary900

    case Tags10
    case Tags2
    case Tags3
    case Tags4
    case Tags5
    case Tags6
    case Tags62
    case Tags7
    case Tags8

    var value: UIColor {
        switch self {
        case .MobilePrimary700:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0, green: 0.2078431373, blue: 0.8431372549, alpha: 1), dark: #colorLiteral(red: 0, green: 0.2078431373, blue: 0.8431372549, alpha: 1))
        case .MobilePrimary600:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0, green: 0.2470588235, blue: 0.8901960784, alpha: 1), dark: #colorLiteral(red: 0, green: 0.2470588235, blue: 0.8901960784, alpha: 1))
        case .MobilePrimary400:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.1921568627, green: 0.3960784314, blue: 0.9529411765, alpha: 1), dark: #colorLiteral(red: 0.1921568627, green: 0.3960784314, blue: 0.9529411765, alpha: 1))
        case .MobilePrimary300:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.3921568627, green: 0.5098039216, blue: 0.9607843137, alpha: 1), dark: #colorLiteral(red: 0.3921568627, green: 0.5098039216, blue: 0.9607843137, alpha: 1))
        case .MobilePrimary200:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.5882352941, green: 0.6470588235, blue: 0.968627451, alpha: 1), dark: #colorLiteral(red: 0.5882352941, green: 0.6470588235, blue: 0.968627451, alpha: 1))
        case .MobilePrimary100:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.7607843137, green: 0.7843137255, blue: 0.9803921569, alpha: 1), dark: #colorLiteral(red: 0.7607843137, green: 0.7843137255, blue: 0.9803921569, alpha: 1))
        case .MobilePrimary0:
            return UIColor.dynamicColor(light: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), dark: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

        case .PrimaryMain200:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.8980392157, green: 0.9294117647, blue: 1, alpha: 1), dark: #colorLiteral(red: 0.8980392157, green: 0.9294117647, blue: 1, alpha: 1))
        case .PrimaryMain300:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.7607843137, green: 0.8156862745, blue: 0.9529411765, alpha: 1), dark: #colorLiteral(red: 0.7607843137, green: 0.8156862745, blue: 0.9529411765, alpha: 1))
        case .PrimaryMain400:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.4784313725, green: 0.6039215686, blue: 0.9529411765, alpha: 1), dark: #colorLiteral(red: 0.4784313725, green: 0.6039215686, blue: 0.9529411765, alpha: 1))
        case .PrimaryMain500:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.1921568627, green: 0.3921568627, blue: 0.9529411765, alpha: 1), dark: #colorLiteral(red: 0.1921568627, green: 0.3921568627, blue: 0.9529411765, alpha: 1))
        case .PrimaryMain700:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.1294117647, green: 0.2666666667, blue: 0.6509803922, alpha: 1), dark: #colorLiteral(red: 0.1294117647, green: 0.2666666667, blue: 0.6509803922, alpha: 1))

        case .Success200:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.8196078431, green: 0.9803921569, blue: 0.8980392157, alpha: 1), dark: #colorLiteral(red: 0.8196078431, green: 0.9803921569, blue: 0.8980392157, alpha: 1))
        case .Success300:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.6549019608, green: 0.9529411765, blue: 0.8156862745, alpha: 1), dark: #colorLiteral(red: 0.6549019608, green: 0.9529411765, blue: 0.8156862745, alpha: 1))
        case .Success400:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.431372549, green: 0.9058823529, blue: 0.7176470588, alpha: 1), dark: #colorLiteral(red: 0.431372549, green: 0.9058823529, blue: 0.7176470588, alpha: 1))
        case .Success500:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.06274509804, green: 0.7254901961, blue: 0.5058823529, alpha: 1), dark: #colorLiteral(red: 0.06274509804, green: 0.7254901961, blue: 0.5058823529, alpha: 1))
        case .Success700:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.01960784314, green: 0.5882352941, blue: 0.4117647059, alpha: 1), dark: #colorLiteral(red: 0.01960784314, green: 0.5882352941, blue: 0.4117647059, alpha: 1))

        case .Warning200:
            return UIColor.dynamicColor(light: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.9215686275, alpha: 1), dark: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.9215686275, alpha: 1))
        case .Warning300:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.7803921569, alpha: 1), dark: #colorLiteral(red: 0.9960784314, green: 0.9529411765, blue: 0.7803921569, alpha: 1))
        case .Warning400:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9921568627, green: 0.9019607843, blue: 0.5411764706, alpha: 1), dark: #colorLiteral(red: 0.9921568627, green: 0.9019607843, blue: 0.5411764706, alpha: 1))
        case .Warning500:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9843137255, green: 0.7490196078, blue: 0.1411764706, alpha: 1), dark: #colorLiteral(red: 0.9843137255, green: 0.7490196078, blue: 0.1411764706, alpha: 1))
        case .Warning700:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9607843137, green: 0.6196078431, blue: 0.0431372549, alpha: 1), dark: #colorLiteral(red: 0.9607843137, green: 0.6196078431, blue: 0.0431372549, alpha: 1))

        case .Error200:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9960784314, green: 0.9490196078, blue: 0.9490196078, alpha: 1), dark: #colorLiteral(red: 0.9960784314, green: 0.9490196078, blue: 0.9490196078, alpha: 1))
        case .Error300:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9960784314, green: 0.8862745098, blue: 0.8862745098, alpha: 1), dark: #colorLiteral(red: 0.9960784314, green: 0.8862745098, blue: 0.8862745098, alpha: 1))
        case .Error400:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9882352941, green: 0.6470588235, blue: 0.6470588235, alpha: 1), dark: #colorLiteral(red: 0.9882352941, green: 0.6470588235, blue: 0.6470588235, alpha: 1))
        case .Error500:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9725490196, green: 0.4431372549, blue: 0.4431372549, alpha: 1), dark: #colorLiteral(red: 0.9725490196, green: 0.4431372549, blue: 0.4431372549, alpha: 1))
        case .Error700:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.937254902, green: 0.2666666667, blue: 0.2666666667, alpha: 1), dark: #colorLiteral(red: 0.937254902, green: 0.2666666667, blue: 0.2666666667, alpha: 1))

        case .GrayPrimary0:
            return UIColor.dynamicColor(light: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), dark: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        case .GrayPrimary100:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9882352941, alpha: 1), dark: #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9882352941, alpha: 1))
        case .GrayPrimary200:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9725490196, green: 0.9803921569, blue: 0.9882352941, alpha: 1), dark: #colorLiteral(red: 0.9725490196, green: 0.9803921569, blue: 0.9882352941, alpha: 1))
        case .GrayPrimary300:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.9764705882, alpha: 1), dark: #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.9764705882, alpha: 1))
        case .GrayPrimary400:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1), dark: #colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1))
        case .GrayPrimary500:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.7960784314, green: 0.8352941176, blue: 0.8823529412, alpha: 1), dark: #colorLiteral(red: 0.7960784314, green: 0.8352941176, blue: 0.8823529412, alpha: 1))
        case .GrayPrimary600:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1), dark: #colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1))
        case .GrayPrimary700:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.2, green: 0.2549019608, blue: 0.3333333333, alpha: 1), dark: #colorLiteral(red: 0.2, green: 0.2549019608, blue: 0.3333333333, alpha: 1))
        case .GrayPrimary800:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.1176470588, green: 0.1607843137, blue: 0.231372549, alpha: 1), dark: #colorLiteral(red: 0.1176470588, green: 0.1607843137, blue: 0.231372549, alpha: 1))
        case .GrayPrimary900:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.06666666667, green: 0.09019607843, blue: 0.1294117647, alpha: 1), dark: #colorLiteral(red: 0.06666666667, green: 0.09019607843, blue: 0.1294117647, alpha: 1))

        case .Tags10:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.3647058824, green: 0.6980392157, blue: 1, alpha: 1), dark: #colorLiteral(red: 0.3647058824, green: 0.6980392157, blue: 1, alpha: 1))
        case .Tags2:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.06666666667, green: 0.662745098, blue: 0.8, alpha: 1), dark: #colorLiteral(red: 0.06666666667, green: 0.662745098, blue: 0.8, alpha: 1))
        case .Tags3:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.1764705882, green: 0.7647058824, blue: 0.9098039216, alpha: 1), dark: #colorLiteral(red: 0.1764705882, green: 0.7647058824, blue: 0.9098039216, alpha: 1))
        case .Tags4:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.6274509804, green: 0.831372549, blue: 0.4078431373, alpha: 1), dark: #colorLiteral(red: 0.6274509804, green: 0.831372549, blue: 0.4078431373, alpha: 1))
        case .Tags5:
            return UIColor.dynamicColor(light: #colorLiteral(red: 1, green: 0.8078431373, blue: 0.3333333333, alpha: 1), dark: #colorLiteral(red: 1, green: 0.8078431373, blue: 0.3333333333, alpha: 1))
        case .Tags6:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.9294117647, green: 0.3058823529, blue: 0.1647058824, alpha: 1), dark: #colorLiteral(red: 0.9294117647, green: 0.3058823529, blue: 0.1647058824, alpha: 1))
        case .Tags62:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.737254902, green: 0.337254902, blue: 0.4745098039, alpha: 1), dark: #colorLiteral(red: 0.737254902, green: 0.337254902, blue: 0.4745098039, alpha: 1))
        case .Tags7:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.4941176471, green: 0.2156862745, blue: 0.5803921569, alpha: 1), dark: #colorLiteral(red: 0.4941176471, green: 0.2156862745, blue: 0.5803921569, alpha: 1))
        case .Tags8:
            return UIColor.dynamicColor(light: #colorLiteral(red: 0.5960784314, green: 0.1058823529, blue: 0.2823529412, alpha: 1), dark: #colorLiteral(red: 0.5960784314, green: 0.1058823529, blue: 0.2823529412, alpha: 1))
        }
    }
}


import Foundation
import UIKit

extension UIColor {
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else {
            return light
        }
        return UIColor {
            switch $0.userInterfaceStyle {
            case .dark:
                return dark
            default:
                return light
            }
        }
    }

    static func `init`(color: ColorTypes) -> UIColor {
        color.value
    }
}
