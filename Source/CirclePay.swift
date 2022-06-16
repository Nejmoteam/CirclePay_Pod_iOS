//
//  CirclePay.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation
import FontBlaster
import IQKeyboardManagerSwift
public class CirclePay {
    public static var merchantToken:String = ""
    public static var accountToken:String = ""
    public static var accountKey:String = ""
    public static let customers : CustomersProtocol = Customers()
    public static let invoices: InvoicesProtocol = Invoices()
    public static let merchants: MerchantsProtocol = Merchants()
    public static let payments: PaymentsProtocol = Payments()
    public static let refunds: RefundsProtocol = Refunds()
    public static let paymentGateways: PaymentGatewaysProtocol = PaymentGateways()
    public static let paymentMethods: PaymentMethodsProtocol = PaymentMethods()
    public static var mode: CirclePayInviroment = .sandBox
    private static var configsWorker: ConfigurationWorkerProtocol = ConfigurationWorker()
    internal static var uiConfigs: ConfigurationModel?
    public static var delegete: CirclePayDelegete?
    
    public init () {}

    public static func prepareSDK() {
        FontBlaster.debugEnabled = true
        FontBlaster.blast()
        IQKeyboardManager.shared.enable = true
    }
    
    public static func excutePayment(with paymentType: PaymentType) {
        switch paymentType {
        case let .Invoice(invoiceNumber):
            if let vc = UIApplication.shared.topMostViewController() {
                CirclePay.getInvoiceDetails(invoiceNumber: invoiceNumber) { viewModel, err, uiConfigs  in
                    if let unwrappedError = err {
                        print("Throw an error here")
                        CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: unwrappedError)
                    } else {
                        if let unwrappedViewModel = viewModel {
                            if unwrappedViewModel.invoiceDetails.status == 1 {
                                print(unwrappedViewModel.invoiceDetails.status)
                                // Paid
                                print("Paid")
                                let error = CirclePayError(errorCode: SDKInternalErrorType.invoiceWasPaid.code, errorMsg: SDKInternalErrorType.invoiceWasPaid.message)
                                CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
                                let invoiceStatus =  BaseNavigationController(rootViewController: InvoicePaymentStatusRouter.createAnModule(with: .paid))
                                invoiceStatus.modalPresentationStyle = .fullScreen
                                vc.present(invoiceStatus, animated: true, completion: nil)

                            } else {
                                //Not Paid
                                let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                                guard let dueDate = unwrappedViewModel.invoiceDetails.dueDate?.toDate(format: .custom(dateFormat)), let currentDate = Date().toDate(dateFormat: .custom(dateFormat)) else {
                                    let error = CirclePayError(errorCode: 20000, errorMsg: "Something went wrong, please try again.")
                                    CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
                                    return
                                }
                                
                                if dueDate < currentDate {
                                    //Expired
                                    print("Expired")
                                    let error = CirclePayError(errorCode: SDKInternalErrorType.invoiceWasExpired.code, errorMsg:SDKInternalErrorType.invoiceWasExpired.message)
                                    CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
                                    let invoiceStatus =  InvoicePaymentStatusRouter.createAnModule(with: .notAvailable)
                                    invoiceStatus.modalPresentationStyle = .fullScreen
                                    vc.present(invoiceStatus, animated: true, completion: nil)
                                } else {
                                    let invoiceFirstScreen =                             BaseNavigationController(rootViewController: InvoiceFirstScreenRouter.createAnModule(invoiceViewModel: unwrappedViewModel))
                                    self.uiConfigs = uiConfigs
                                    invoiceFirstScreen.modalPresentationStyle = .fullScreen
                                    vc.present(invoiceFirstScreen, animated: true, completion: nil)
                                }
                            }
                        } else {
                            let error = CirclePayError(errorCode: SDKInternalErrorType.failedToGetInvoices.code, errorMsg: SDKInternalErrorType.failedToGetInvoices.message)
                            CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
                        }
                    }
                }
            } else {
                print("failed to get top view Controller")
                let error = CirclePayError(errorCode: 20000, errorMsg: "Can't get your top most ViewController")
                CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
            }
        }
    }
    
    fileprivate static
    func getInvoiceDetails(invoiceNumber: String,completion: @escaping (InvoiceFirstScreenViewModel?, CirclePayError?, ConfigurationModel?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var invoiceDetails : InvoiceCodable?
        var merchantDetails: MerchantCodable?
        var uiConfigs: ConfigurationModel?

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
        dispatchGroup.enter()
        CirclePay.configsWorker.getConfigurations(merchantToken: CirclePay.merchantToken, type: "") { result in
            switch result {
            case .success(let resp):
                if let unwrappedData = resp?.data , unwrappedData.count != 0{
                    uiConfigs = unwrappedData.first
                } else {
                    let err = CirclePayError(errorCode: SDKInternalErrorType.failedToGetConfigs.code, errorMsg: resp?.details ?? "")
                    error = err
                }
                dispatchGroup.leave()
            case .failure(let err):
                let err = CirclePayError(errorCode: SDKInternalErrorType.failedToGetConfigs.code, errorMsg: err.message)
                error = err
                dispatchGroup.leave()
            }
        }
        
        
        dispatchGroup.notify(queue: .main) {
            guard invoiceDetails != nil && merchantDetails != nil else {
                completion(nil, error, nil)
                return
            }
            if let unwrappedInvoiceDetails = invoiceDetails , let unwrappedMerchant = merchantDetails {
                let viewModel = InvoiceFirstScreenViewModel(invoiceDetails: unwrappedInvoiceDetails, merchantDetails: unwrappedMerchant)
                completion(viewModel, nil, uiConfigs)
            } else {
                completion(nil, error, nil)
            }
        }
    }
    
    
}


public enum CirclePayInviroment: String {
    case staging = "https://staging-openapi.circlepay.ai/"
    // case preProduction = "https://preprod-openapi-admin.circlepay.ai"
    case production = "https://openapi-admin.circlepay.ai/"
    case sandBox =  "https://sandbox-openapi-admin.circlepay.ai/"
}


public enum PaymentType {
   // case PaymentLink(paymentLinkUrl: String)
    case Invoice(invoiceNumber: String)
}


public protocol CirclePayDelegete {
    func didGetErrorAtCheckoutProcess(error: CirclePayError)
    func didPaidTransactionSucsessfully(transaction: TransactionResult)
    func didGetErrorAtPayingTransaction(transaction: TransactionResult, error: CirclePayError)
    
}

public struct TransactionResult {
    var paymentGatewayName: String?
    var paymentMethodName: String?
    var transactionId: String?
    var transactoinStatus: String?
    var transactionType: Int
}
