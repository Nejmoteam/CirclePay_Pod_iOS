import Foundation
protocol CustomersWorkerProtocol {
    func createCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[CreateCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func updateCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String, completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[UpdateCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func getCustomer(mobileNumber:String,  completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[GetCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
    
    func listCustomers( completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[GetCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)
}

class CustomersWorker: APIRequestExecuter<CustomersNetworking>, CustomersWorkerProtocol {
    func createCustomer(firstName: String, lastName: String, address: String, country: String, governorate: String, city: String, aptNumber: String, email: String, mobileNumber: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[CreateCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .create(firstName: firstName, lastName: lastName, address: address, country: country, governorate: governorate, city: city, aptNumber: aptNumber, email: email, mobileNumber: mobileNumber), responseClass: BaseAPIRequestResponseModel<[CreateCustomerCodable]>.self) { results in
            completion(results)
        }
    }
    
    func updateCustomer(firstName: String, lastName: String, address: String, country: String, governorate: String, city: String, aptNumber: String, email: String, mobileNumber: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[UpdateCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .update(firstName: firstName, lastName: lastName, address: address, country: country, governorate: governorate, city: city, aptNumber: aptNumber, email: email, mobileNumber: mobileNumber), responseClass: BaseAPIRequestResponseModel<[UpdateCustomerCodable]>.self) { results in
            completion(results)
        }
    }
    
    func getCustomer(mobileNumber: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[GetCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .get(mobileNumber: mobileNumber), responseClass: BaseAPIRequestResponseModel<[GetCustomerCodable]>.self) { results in
            completion(results)
        }
    }
    
    func listCustomers(completion: @escaping (Result<BaseAPIRequestResponseModel<[GetCustomerCodable]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        self.performRequest(target: .list, responseClass: BaseAPIRequestResponseModel<[GetCustomerCodable]>.self) { results in
            completion(results)
        }
    }
}
