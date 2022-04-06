//
//  CustomersNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 10/01/2022.
//

import Alamofire
import Foundation
enum CustomersNetworking {
    case getsCustomers(page: Int, limit: Int, minRevenue: String?, maxRevenue: String?, minRefund: String?, maxRefund: String?, name: String?, phone: String?)

    case getSingleCustomer(id: Int)
    case getCustomerPayments(id: Int)
    case getCustomerRefunds(id: Int)
    case getCustomerPaymentLinks(id: Int)
    case getCustomerInvoices(id: Int)
    case getTotalPayments
}

extension CustomersNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .getsCustomers:
            return "members"
        case let .getSingleCustomer(id):
            return "members/fetchSingleCustomer/\(id)"
        case let .getCustomerPayments(id):
            return "members/getPayments/\(id)"
        case let .getCustomerRefunds(id):
            return "refunds/customerRefunds/\(id)"
        case let .getCustomerPaymentLinks(id):
            return "members/getPaymentLinks/\(id)"
        case let .getCustomerInvoices(id):
            return "members/getInvoices/\(id)"
        case .getTotalPayments:
            return "payments/all/transactionHeaderValueWithGatewayFeesSubtracted"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getsCustomers:
            return .get
        case .getSingleCustomer:
            return .get
        case .getCustomerPayments:
            return .get
        case .getCustomerRefunds:
            return .get
        case .getCustomerPaymentLinks:
            return .get
        case .getCustomerInvoices:
            return .get
        case .getTotalPayments:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .getsCustomers(page, limit, minRevenue, maxRevenue, minRefund, maxRefund, name, phone):
            var params: [String: Any] = ["page": page, "limit": limit]
            if minRevenue != nil {
                params["minRevenue"] = minRevenue
            }
            if maxRevenue != nil {
                params["maxRevenue"] = maxRevenue
            }

            if minRefund != nil {
                params["minRefund"] = minRefund
            }

            if maxRefund != nil {
                params["maxRefund"] = maxRefund
            }

            if name != nil {
                params["name"] = name
            }

            if phone != nil {
                params["phone"] = phone
            }
            return .WithParametersRequest(parameters: params, encoding: URLEncoding.queryString)

        case .getSingleCustomer:
            return .normalRequest
        case .getCustomerPayments:
            return .normalRequest
        case .getCustomerRefunds:
            return .normalRequest
        case .getCustomerPaymentLinks:
            return .normalRequest
        case .getCustomerInvoices:
            return .normalRequest
        case .getTotalPayments:
            return .normalRequest
        }
    }
}
