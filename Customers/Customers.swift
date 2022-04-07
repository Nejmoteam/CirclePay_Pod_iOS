//
//  Customers.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 06/04/2022.
//

import Foundation
public protocol CustomersProtocol: class {
    func createCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String,  completion: @escaping (CreateCustomerCodable?, String?) -> Void)
    
    func updateCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String,  completion: @escaping (UpdateCustomerCodable?, String?) -> Void)
    
    func getCustomer(mobileNumber:String, completion: @escaping (GetCustomerCodable?, String?) -> Void)
    
    func listCustomers(completion: @escaping ([GetCustomerCodable]?, String?) -> Void)
}
public class Customers: CustomersProtocol{
    private let customersWorker: CustomersWorkerProtocol = CustomersWorker()
    
    public func createCustomer(firstName:String, lastName:String, address:String, country:String, governorate:String, city:String, aptNumber:String, email:String, mobileNumber:String,  completion: @escaping (CreateCustomerCodable?, String?) -> Void) {
        customersWorker.createCustomer(firstName: firstName, lastName: lastName, address: address, country: country, governorate: governorate, city: city, aptNumber: aptNumber, email: email, mobileNumber: mobileNumber) { results in
            switch results{
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func updateCustomer(firstName: String, lastName: String, address: String, country: String, governorate: String, city: String, aptNumber: String, email: String, mobileNumber: String, completion: @escaping (UpdateCustomerCodable?, String?) -> Void) {
        customersWorker.updateCustomer(firstName: firstName, lastName: lastName, address: address, country: country, governorate: governorate, city: city, aptNumber: aptNumber, email: email, mobileNumber: mobileNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func getCustomer(mobileNumber: String, completion: @escaping (GetCustomerCodable?, String?) -> Void) {
        customersWorker.getCustomer(mobileNumber: mobileNumber) { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data?.first, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    public func listCustomers(completion: @escaping ([GetCustomerCodable]?, String?) -> Void) {
        customersWorker.listCustomers { results in
            switch results {
            case let .success(model):
                if model?.isError == true {
                    completion(nil, model?.details)
                } else {
                    completion(model?.data, nil)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
