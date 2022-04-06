import Foundation
protocol CustomersWorkerProtocol {
    func getCustomersList(page: Int, limit: Int, minRevenue: String?, maxRevenue: String?, minRefund: String?, maxRefund: String?, name: String?, phone: String?, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<CustomersData>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getSingleCustomer(id: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[CustomersDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getCustomerPayments(id: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[TransactionPaymentEntity]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getCustomerRefunds(id: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[TransactionRefundEntity]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getCustomerPaymentLinks(id: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[PaymentLinksDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getCustomerInvoices(id: Int, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[InvoicesDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

    func getPaymentsHeader(completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<TotalPaymentsHeader>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class CustomersWorker: APIRequestExecuter<CustomersNetworking>, CustomersWorkerProtocol {
    func getCustomersList(page: Int, limit: Int, minRevenue: String?, maxRevenue: String?, minRefund: String?, maxRefund: String?, name: String?, phone: String?, completion: @escaping (Result<BaseAPIRequestResponseModel<CustomersData>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getsCustomers(page: page, limit: limit, minRevenue: minRevenue, maxRevenue: maxRevenue, minRefund: minRefund, maxRefund: maxRefund, name: name, phone: phone), responseClass: BaseAPIRequestResponseModel<CustomersData>.self) { results in
            completion(results)
        }
    }

    func getSingleCustomer(id: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[CustomersDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getSingleCustomer(id: id), responseClass: BaseAPIRequestResponseModel<[CustomersDataValues]>.self) { results in
            completion(results)
        }
    }

    func getCustomerPayments(id: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[TransactionPaymentEntity]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getCustomerPayments(id: id), responseClass: BaseAPIRequestResponseModel<[TransactionPaymentEntity]>.self) { results in
            completion(results)
        }
    }

    func getCustomerRefunds(id: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[TransactionRefundEntity]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getCustomerRefunds(id: id), responseClass: BaseAPIRequestResponseModel<[TransactionRefundEntity]>.self) { results in
            completion(results)
        }
    }

    func getCustomerPaymentLinks(id: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[PaymentLinksDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getCustomerPaymentLinks(id: id), responseClass: BaseAPIRequestResponseModel<[PaymentLinksDataValues]>.self) { results in
            completion(results)
        }
    }

    func getCustomerInvoices(id: Int, completion: @escaping (Result<BaseAPIRequestResponseModel<[InvoicesDataValues]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getCustomerInvoices(id: id), responseClass: BaseAPIRequestResponseModel<[InvoicesDataValues]>.self) { results in
            completion(results)
        }
    }

    func getPaymentsHeader(completion: @escaping (Result<BaseAPIRequestResponseModel<TotalPaymentsHeader>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .getTotalPayments, responseClass: BaseAPIRequestResponseModel<TotalPaymentsHeader>.self) { results in
            completion(results)
        }
    }
}
