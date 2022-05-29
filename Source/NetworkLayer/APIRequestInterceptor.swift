//
//  APIRequestInterceptor.swift
//  CirclePay
//
//  Created Alchemist on 06/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import Alamofire
import Foundation

final class APIRequestInterceptor: RequestInterceptor {

    func adapt(_ urlRequest: URLRequest, for _: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if !CirclePay.merchantToken.isEmpty {
            urlRequest.headers.add(name: "merchant-token", value: "Bearer \(CirclePay.merchantToken)")
        }
        urlRequest.headers.add(name: "account-token", value: "Bearer \(CirclePay.accountToken)")
        urlRequest.headers.add(name: "account-key", value: CirclePay.accountKey)
        completion(.success(urlRequest))
    }

    func retry(_: Request, for _: Session, dueTo _: Error, completion _: @escaping (RetryResult) -> Void) {}
}
