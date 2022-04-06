//
//  TransactionsNetworking.swift
//  CirclePay
//
//  Created by apple on 09/01/2022.
//

import Alamofire
import Foundation
enum TransactionsNetworking {
    case getPayments(page: Int, limit: Int, minValue: Double?, maxValue: Double?, minDate: String?, maxDate: String?, paymentMethod: String?, status: String?, operationId: Int?, transactionId: Int?, coupon: String?, invoiceId: Int?, oid: Int?)
    case getRefunds(userId: Int, page: Int, limit: Int, minValue: Double?, maxValue: Double?, minDate: String?, maxDate: String?, paymentMethod: String?, status: String?, operationId: Int?, transactionId: Int?, coupon: String?, invoiceId: Int?, oid: Int?)

    case getSinglePayment(transactionId: Int)
    case getSingleRefund(transactionId: Int)
    case getTotalPayments
    case getTotalRefunds(userId: Int)
}

extension TransactionsNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .getPayments:
            return "payments/all"
        case let .getRefunds(userId, _, _, _, _, _, _, _, _, _, _, _, _, _):
            return "refunds/againstUserId/\(userId)"
        case let .getSinglePayment(transactionId):
            return "payments/\(transactionId)"
        case let .getSingleRefund(transactionId):
            return "refunds/\(transactionId)"
        case .getTotalPayments:
            return "payments/all/transactionHeaderValueWithGatewayFeesSubtracted"
        case let .getTotalRefunds(userId):
            return "refunds/fetchRefundsheader/overall/\(userId)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getPayments:
            return .get
        case .getRefunds:
            return .get
        case .getSinglePayment:
            return .get
        case .getSingleRefund:
            return .get
        case .getTotalPayments:
            return .get
        case .getTotalRefunds:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .getPayments(page, limit, minValue, maxValue, minDate, maxDate, paymentMethod, status, operationId, transactionId, coupon, invoiceId, oid):
            var params: [String: Any] = ["page": page, "limit": limit]
            params["minValue"] = minValue ?? ""
            params["maxValue"] = maxValue ?? ""
            params["minDate"] = minDate ?? ""
            params["maxDate"] = maxDate ?? ""
            params["paymentMethod"] = paymentMethod ?? ""
            params["status"] = status ?? ""
            params["operationId"] = operationId ?? ""
            params["transactionId"] = transactionId ?? ""
            params["coupon"] = coupon ?? ""
            params["invoiceId"] = invoiceId ?? ""
            params["oid"] = oid ?? ""
            return .WithParametersRequest(parameters: params, encoding: URLEncoding.default)

        case let .getRefunds(_, page, limit, minValue, maxValue, minDate, maxDate, paymentMethod, status, operationId, transactionId, coupon, invoiceId, oid):
            var params: [String: Any] = ["page": page, "limit": limit]
            params["minValue"] = minValue ?? ""
            params["maxValue"] = maxValue ?? ""
            params["minDate"] = minDate ?? ""
            params["maxDate"] = maxDate ?? ""
            params["paymentMethod"] = paymentMethod ?? ""
            params["status"] = status ?? ""
            params["operationId"] = operationId ?? ""
            params["transactionId"] = transactionId ?? ""
            params["coupon"] = coupon ?? ""
            params["invoiceId"] = invoiceId ?? ""
            params["oid"] = oid ?? ""
            return .WithParametersRequest(parameters: params, encoding: URLEncoding.default)
        case .getSinglePayment:
            return .normalRequest
        case .getSingleRefund:
            return .normalRequest
        case .getTotalPayments:
            return .normalRequest
        case .getTotalRefunds:
            return .normalRequest
        }
    }
}
