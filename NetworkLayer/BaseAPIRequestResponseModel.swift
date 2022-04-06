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
    var status: Bool?
    var message: String?
    var isError: Bool?
//    var errorCode: String?
    var details: String?
    var data: T?

//    var token: String?
//    var user: UserEntity?
//    // let newsEntityWhere: Where?
//
//    enum CodingKeys: String, CodingKey {
//        case status, message, data, token, user
//        // case newsEntityWhere = "where"
//    }
}

//
// class Where: Codable {
//    let userID, isDeleted: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "UserId"
//        case isDeleted
//    }
// }
