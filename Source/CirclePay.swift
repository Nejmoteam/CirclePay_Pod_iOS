//
//  CirclePay.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation
import FontBlaster
public class CirclePay {
    public static var merchantToken:String = ""
    public static var accountToken:String = ""
    public static var accountKey:String = ""
    public init () {}
    public static let customers : CustomersProtocol = Customers()
    public static let invoices: InvoicesProtocol = Invoices()
    public static let merchants: MerchantsProtocol = Merchants()
    public static let payments: PaymentsProtocol = Payments()
    public static let refunds: RefundsProtocol = Refunds()
    public static let paymentGateways: PaymentGatewaysProtocol = PaymentGateways()
    public static let paymentMethods: PaymentMethodsProtocol = PaymentMethods()
    public static var mode: Inviroment = .sandBox
    
    public static func prepareSDK() {
        FontBlaster.debugEnabled = true
        FontBlaster.blast()
        
    }
    
    public static func excutePayment(with paymentType: PaymentType) {
        switch paymentType {
        case .PaymentLink:
            if let vc = UIApplication.shared.topMostViewController() {
                let paymentLinkScreen = PaymentLinkFirstScreenRouter.createAnModule()
                paymentLinkScreen.modalPresentationStyle = .fullScreen
                vc.present(paymentLinkScreen, animated: true, completion: nil)
            } else {
                print("failed to get top view Controller")
            }
        case let .Invoice(invoiceNumber):
            if let vc = UIApplication.shared.topMostViewController() {
                CirclePay.getInvoiceDetails(invoiceNumber: invoiceNumber) { viewModel, err in
                    if err != nil {
                        print(err)
                        print("Throw an error here")
                    } else {
                        if let unwrappedViewModel = viewModel {
                            let invoiceFirstScreen = InvoiceFirstScreenRouter.createAnModule(invoiceViewModel: unwrappedViewModel)
                            invoiceFirstScreen.modalPresentationStyle = .fullScreen
                            vc.present(invoiceFirstScreen, animated: true, completion: nil)
                        } else {
                            print("Throw an error here")
                        }
                    }
                }
            } else {
                print("failed to get top view Controller")
            }
        }
    }
    
   public static
   func getInvoiceDetails(invoiceNumber: String,completion: @escaping (InvoiceFirstScreenViewModel?, CirclePayError?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var invoiceDetails : InvoiceCodable?
        var merchantDetails: MerchantCodable?
        var error: CirclePayError?
        dispatchGroup.enter()
        CirclePay.invoices.getInvoice(invoiceNumber: invoiceNumber) { invoice, err in
            if err != nil {
                error = err
                dispatchGroup.leave()
            } else {
                invoiceDetails = invoice
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        CirclePay.merchants.getMerchant { merchant, err in
            if err != nil {
                error = err
                dispatchGroup.leave()
            } else {
                merchantDetails = merchant
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: .main) {
            guard invoiceDetails != nil && merchantDetails != nil else {
                completion(nil, error)
                return
            }
            if let unwrappedInvoiceDetails = invoiceDetails , let unwrappedMerchant = merchantDetails {
                let viewModel = InvoiceFirstScreenViewModel(invoiceDetails: unwrappedInvoiceDetails, merchantDetails: unwrappedMerchant)
                completion(viewModel, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}


public enum Inviroment: String {
    case staging = "https://staging-openapi.circlepay.ai/"
    // case preProduction = "https://preprod-openapi-admin.circlepay.ai"
    case production = "https://openapi-admin.circlepay.ai/"
    case sandBox =  "https://sandbox-openapi-admin.circlepay.ai/"
}


public enum PaymentType {
    case PaymentLink(paymentLinkUrl: String)
    case Invoice(invoiceNumber: String)
}
