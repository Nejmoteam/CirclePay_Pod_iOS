//
//  APIRequestBuilder.swift
//  CirclePay
//
//  Created Alchemist on 06/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Alamofire
import Foundation

// MARK: - BluePrint For Every Request

protocol APIRequestBuilder {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}

extension APIRequestBuilder {
    var baseUrl: String {
        "https://staging-openapi.circlepay.ai/"
    }

    var headers: [String: String]? {
        switch task {
        case .normalRequest, .WithParametersRequest:
            return ["Accept": "*/*", "Accept-Encoding": "gzip, deflate, br", "Connection": "keep-alive", "User-Agent": "PostmanRuntime/7.26.8"]
        case .multiPartRequest:
            return ["application/json": "Accept"]
        }
    }
}

// Method
enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// Task
enum Task {
    case normalRequest
    case WithParametersRequest(parameters: [String: Any], encoding: ParameterEncoding)
    case multiPartRequest(parameters: [String: Any]?, multiPartData: [MultiPartData], encoding: ParameterEncoding)
}

struct MultiPartData {
    var dataKey: String
    var dataValue: Data
    var dataType: MultiPartDataType
    var dataExtension: MultiPartDataExtension
}

enum MultiPartDataType: String {
    case imagePng = "image/png"
    case imageJpeg = "image/jpeg"
    case videoMov = "video/mov"
    case videoMp4 = "video/mp4"
    case pdf = "application/pdf"
    case docs = "application/doc"
    case excel = "application/xls"
    case ppt = "application/ppt"
}

enum MultiPartDataExtension: String {
    case png = ".png"
    case jpeg = ".jpeg"
    case mov = ".mov"
    case mp4 = ".mp4"
    case pdf = ".pdf"
    case docs = ".doc"
    case excel = ".xls"
    case ppt = ".ppt"
}
