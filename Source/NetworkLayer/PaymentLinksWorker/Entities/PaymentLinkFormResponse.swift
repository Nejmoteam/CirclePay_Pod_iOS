//
//  PaymentLinkForm.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 22/05/2022.
//

import Foundation

public struct PaymentLinkFormResponse {
    var answers: [PaymentLinkFormAnswer]
    var customerMobile:String
    var formId:String
    var id:String
}


public struct PaymentLinkFormAnswer {
    var answer:String
    var mandatory:Bool
}
