//
//  PaymentLinksNetworking.swift
//  CirclePay
//
//  Created by Alchemist on 03/01/2022.
//
import Alamofire
import Foundation
enum PaymentLinksNetworking {
    case getPaymentLinks(page: Int, limit: Int, coupon: String?, cFlag: Bool?, label: String?, lFlag: Bool?, minValue: String?, maxValue: String?, vFlag: Bool?, minTrans: String?, maxTrans: String?, tFlag: Bool?, minRevenue: String?, maxRevenue: String?, rFlag: Bool?, cDateFlag: Bool?, cStartDate: String?, cEndDate: String?, eDateFlag: Bool?, eStartDate: String?, eEndDate: String?)

    case getPaymentLinkDetails(id: String)
    case getPaymentLinksCustomers(id: String)
    case getPaymentLinksRefunds(id: String)
    case getPaymentLinksCuppons(id: String)
    case getTotalCollected(date: String)
    case getAvgDailyRevenue(date: String)
}

extension PaymentLinksNetworking: APIRequestBuilder {
    var path: String {
        switch self {
        case .getPaymentLinks:
            return "paymentLinks/all/0"
        case let .getPaymentLinkDetails(id):
            return "paymentLinks/\(id)"
        case let .getPaymentLinksCustomers(id):
            return "payments/fetchAllMembersByPaymentLink/\(id)"
        case let .getPaymentLinksRefunds(id):
            return "payments/fetchAllPaymentRefundedPaid/\(id)"
        case let .getPaymentLinksCuppons(id):
            return "coupons/\(id)"
        case let .getTotalCollected(date):
            return "payments/fetchTransactionsheader/overall/\(date)"
        case let .getAvgDailyRevenue(date):
            return "payments/fetchAvgDailyRevenue/overall/\(date)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getPaymentLinks:
            return .get
        case .getPaymentLinkDetails:
            return .get
        case .getPaymentLinksCustomers:
            return .get
        case .getPaymentLinksRefunds:
            return .get
        case .getPaymentLinksCuppons:
            return .get
        case .getTotalCollected:
            return .get
        case .getAvgDailyRevenue:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .getPaymentLinks(page,
                                  limit,
                                  coupon,
                                  cFlag,
                                  label, lFlag,
                                  minValue,
                                  maxValue, vFlag,
                                  minTrans,
                                  maxTrans, tFlag,
                                  minRevenue,
                                  maxRevenue, rFlag,
                                  cDateFlag,
                                  cStartDate, cEndDate,
                                  eDateFlag, eStartDate,
                                  eEndDate):
            var params: [String: Any] = ["page": page, "limit": limit]
            params["coupon"] = coupon ?? ""
            params["cFlag"] = cFlag ?? ""
            params["label"] = label ?? ""
            params["lFlag"] = lFlag ?? ""
            params["minValue"] = minValue ?? ""
            params["maxValue"] = maxValue ?? ""
            params["vFlag"] = vFlag ?? ""
            params["minTrans"] = minTrans ?? ""
            params["maxTrans"] = maxTrans ?? ""
            params["tFlag"] = tFlag ?? ""
            params["minRevenue"] = minRevenue ?? ""
            params["maxRevenue"] = maxRevenue ?? ""
            params["rFlag"] = rFlag ?? ""
            params["cDateFlag"] = cDateFlag ?? ""
            params["cStartDate"] = cStartDate ?? ""
            params["cEndDate"] = cEndDate ?? ""
            params["eDateFlag"] = eDateFlag ?? ""
            params["eStartDate"] = eStartDate ?? ""
            params["eEndDate"] = cEndDate ?? ""
            return .WithParametersRequest(parameters: params, encoding: URLEncoding.queryString)
        case .getPaymentLinkDetails:
            return .normalRequest
        case .getPaymentLinksCustomers:
            return .normalRequest
        case .getPaymentLinksRefunds:
            return .normalRequest
        case .getPaymentLinksCuppons:
            return .normalRequest
        case .getTotalCollected:
            return .normalRequest
        case .getAvgDailyRevenue:
            return .normalRequest
        }
    }
}
