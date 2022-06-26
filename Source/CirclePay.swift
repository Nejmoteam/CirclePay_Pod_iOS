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
    fileprivate static var configsWorker: ConfigurationWorkerProtocol = ConfigurationWorker()
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
                self.getInvoiceDetails(invoiceNumber: invoiceNumber) { viewModel, err, uiConfigs  in
                    if let unwrappedError = err {
                        print("Throw an error here")
                        CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: unwrappedError)
                        return
                    } else {
                        self.uiConfigs = uiConfigs
                        if let unwrappedViewModel = viewModel {
                            let status = CheckoutInvoiceResult.Initial.prepare(vm: unwrappedViewModel, topVc: vc)
                            switch status {
                            case .Expired:
                                self.handleInvoiceExpiredStatuss(invoiceViewModel: unwrappedViewModel, topViewController: vc)
                                return
                            case .Paid:
                                self.handleInvoicePaidStatus(invoiceViewModel: unwrappedViewModel, topViewController: vc)
                                return
                            case .Valid:
                                self.handleInvoiceValidStatus(invoiceViewModel: unwrappedViewModel, topViewController: vc)
                            default:
                                return
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
    
    fileprivate static func handleInvoicePaidStatus(invoiceViewModel:InvoiceFirstScreenViewModel, topViewController: UIViewController) {
        // Paid
        print("Paid")
        
        let error = CirclePayError(errorCode: SDKInternalErrorType.invoiceWasPaid.code, errorMsg: SDKInternalErrorType.invoiceWasPaid.message)
        CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
        let invoiceStatus =  BaseNavigationController(rootViewController: InvoicePaymentStatusRouter.createAnModule(with: .paid, invoiceViewModel: invoiceViewModel, withDelegete: nil))
        invoiceStatus.modalPresentationStyle = .fullScreen
        topViewController.present(invoiceStatus, animated: true, completion: nil)
    }
    
    fileprivate static func handleInvoiceExpiredStatuss(invoiceViewModel:InvoiceFirstScreenViewModel, topViewController: UIViewController) {
            let error = CirclePayError(errorCode: SDKInternalErrorType.invoiceWasExpired.code, errorMsg:SDKInternalErrorType.invoiceWasExpired.message)
            CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
            let invoiceStatus =  InvoicePaymentStatusRouter.createAnModule(with: .notAvailable, invoiceViewModel: invoiceViewModel, withDelegete: nil)
            invoiceStatus.modalPresentationStyle = .fullScreen
            topViewController.present(invoiceStatus, animated: true, completion: nil)
    }
    
    fileprivate static func handleInvoiceValidStatus(invoiceViewModel:InvoiceFirstScreenViewModel, topViewController: UIViewController) {
        let invoiceFirstScreen = BaseNavigationController(rootViewController: InvoiceFirstScreenRouter.createAnModule(invoiceViewModel: invoiceViewModel))
        invoiceFirstScreen.modalPresentationStyle = .fullScreen
        topViewController.present(invoiceFirstScreen, animated: true, completion: nil)
    }
    
    fileprivate static func isInvoicePaid(invoiceStatus:Int?) -> Bool {
        if invoiceStatus == 1 {
            return true
        }
        return false
    }
    
    fileprivate static func isInvoiceExpired(dueDate: String?) -> Bool {
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let dueDate = dueDate?.toDate(format: .custom(dateFormat)), let currentDate = Date().toDate(dateFormat: .custom(dateFormat)) else {
            let error = CirclePayError(errorCode: 20000, errorMsg: "Something went wrong, please try again.")
            CirclePay.delegete?.didGetErrorAtCheckoutProcess(error: error)
            return true
        }
        
        if currentDate > dueDate {
            return true
        } else {
            return false
        }
    }
}

fileprivate enum CheckoutInvoiceResult {
    case Paid
    case Expired
    case Valid
    case Initial
    
    func prepare(vm: InvoiceFirstScreenViewModel , topVc: UIViewController) -> Self {
        if CirclePay.isInvoicePaid(invoiceStatus: vm.invoiceDetails.status) {
            return .Paid
        } else if CirclePay.isInvoiceExpired(dueDate: vm.invoiceDetails.dueDate) {
            return .Expired
        } else {
            return .Valid
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
