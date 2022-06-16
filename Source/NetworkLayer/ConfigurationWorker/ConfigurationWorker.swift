//
//  ConfigurationWorker.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 31/05/2022.
//

import Foundation
import Foundation
protocol ConfigurationWorkerProtocol {
    func getConfigurations(merchantToken:String,type:String,  completion: @escaping (Swift.Result<BaseAPIRequestResponseModel<[ConfigurationModel]>?, BaseAPIRequestResponseFailureErrorType>) -> Void)

}

class ConfigurationWorker: APIRequestExecuter<ConfigurationNetworking>, ConfigurationWorkerProtocol {
    func getConfigurations(merchantToken: String, type: String, completion: @escaping (Result<BaseAPIRequestResponseModel<[ConfigurationModel]>?, BaseAPIRequestResponseFailureErrorType>) -> Void) {
        return self.performRequest(target: .getConfiguration(merchantToken: merchantToken, type: type), responseClass: BaseAPIRequestResponseModel<[ConfigurationModel]>.self) { result in
            completion(result)
        }
    }
}


