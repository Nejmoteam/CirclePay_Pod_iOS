//
//  Customers.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation
public protocol CustomersProtocol {
    func createCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String,  completion: @escaping (CreateCustomerCodable?, CirclePayError?) -> Void)
    
    func updateCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String,  completion: @escaping (UpdateCustomerCodable?, CirclePayError?) -> Void)
    
    func getCustomer(mobileNumber:String, completion: @escaping (CustomerCodable?, CirclePayError?) -> Void)
    
    func listCustomers(completion: @escaping ([CustomerCodable]?, CirclePayError?) -> Void)
}
public class Customers: CustomersProtocol{
    private let customersWorker: CustomersWorkerProtocol = CustomersWorker()
    
    
    public func createCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String,  completion: @escaping (CreateCustomerCodable?, CirclePayError?) -> Void) {
        customersWorker.createCustomer(firstName: firstName, lastName: lastName, address: address, country: country, governorate: governorate, city: city, aptNumber: aptNumber, email: email, mobileNumber: mobileNumber) { results in
            switch results{
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func updateCustomer(firstName: String, lastName: String, address: String, country: String, governorate: String, city: String, aptNumber: String, email: String, mobileNumber: String, completion: @escaping (UpdateCustomerCodable?, CirclePayError?) -> Void) {
        customersWorker.updateCustomer(firstName: firstName, lastName: lastName, address: address, country: country, governorate: governorate, city: city, aptNumber: aptNumber, email: email, mobileNumber: mobileNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func getCustomer(mobileNumber: String, completion: @escaping (CustomerCodable?, CirclePayError?) -> Void) {
        customersWorker.getCustomer(mobileNumber: mobileNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
    
    public func listCustomers(completion: @escaping ([CustomerCodable]?, CirclePayError?) -> Void) {
        customersWorker.listCustomers { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil,CirclePayError(errorCode: model?.errorCode, errorMsg: model?.details))
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, CirclePayError(errorCode:0, errorMsg: error.localizedDescription))
            }
        }
    }
}
