//
//  InvoicesNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 25/12/2021.
//

import Alamofire
import Foundation
enum InvoicesNetworking {
    case getInvoices(page: Int, limit: Int, cStart: String?, cEnd: String?, dStart: String?, dEnd: String?, cName: String?, number: String?, value: String?, value2: String?, method: String?, tid: String?, oid: String?, status: String?)
    case getInvoicesDetails(invoiceId: String)
    case getInvoicesTotalCollected
    case getInvoicesTotalOverdue
}

extension InvoicesNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .getInvoices:
            return "invoices/all"
        case let .getInvoicesDetails(invoiceId):
            return "invoices/\(invoiceId)"
        case .getInvoicesTotalCollected:
            return "invoices/totalCollected"
        case .getInvoicesTotalOverdue:
            return "invoices/totalOverdue"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getInvoices:
            return .get
        case .getInvoicesDetails:
            return .get
        case .getInvoicesTotalCollected:
            return .get
        case .getInvoicesTotalOverdue:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .getInvoices(page, limit, cStart, cEnd, dStart, dEnd, cName, number, value, value2, method, tid, oid, status):
            var params: [String: Any] = ["page": page, "limit": limit]
            params["cStart"] = cStart ?? ""
            params["cEnd"] = cEnd ?? ""
            params["dStart"] = dStart ?? ""
            params["dEnd"] = dEnd ?? ""
            params["cName"] = cName ?? ""
            params["number"] = number ?? ""
            params["value"] = value ?? ""
            params["value2"] = value2 ?? ""
            params["method"] = method ?? ""
            params["tid"] = tid ?? ""
            params["oid"] = oid ?? ""
            params["status"] = status ?? ""
//            if cStart != nil {}
//            if cEnd != nil {
//            }
//
//            if dStart != nil {
//            }
//
//            if dEnd != nil {
//            }
//
//            if cName != nil {
//            }
//
//            if number != nil {
//            }
//
//            if value != nil {
//            }
//
//            if value2 != nil {
//            }
//            if method != nil {
//            }
//            if tid != nil {
//            }
//            if oid != nil {
//            }
//            if status != nil {
//            }
            return .WithParametersRequest(parameters: params, encoding: URLEncoding.queryString)

        case .getInvoicesDetails:
            return .normalRequest

        case .getInvoicesTotalCollected:
            return .normalRequest
        case .getInvoicesTotalOverdue:
            return .normalRequest
        }
    }
}
