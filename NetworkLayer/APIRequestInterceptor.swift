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
        let token =  ""
        var urlRequest = urlRequest
        urlRequest.headers.add(.authorization(bearerToken: token))
        completion(.success(urlRequest))
    }

    func retry(_: Request, for _: Session, dueTo _: Error, completion _: @escaping (RetryResult) -> Void) {}
}
