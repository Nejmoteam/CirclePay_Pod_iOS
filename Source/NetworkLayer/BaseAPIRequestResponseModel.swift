//
//  BaseAPIRequestResponseModel.swift
//  CirclePay
//
//  Created Alchemist on 06/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Foundation

struct BaseAPIRequestResponseModel<T: Codable>: Codable {
    var message: String?
    var isError: Bool?
    var errorCode: Int?
    var details: String?
    var data: T?
}
