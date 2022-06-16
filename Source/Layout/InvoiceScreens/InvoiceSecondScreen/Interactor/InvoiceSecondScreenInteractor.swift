//
//  InvoiceSecondScreenInteractor.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
class InvoiceSecondScreenInteractor: InvoiceSecondScreenInteractorInPutProtocol {
    private let merchantWorker: MerchantsWorkerProtocol = MerchantsWorker()

   weak var presenter: InvoiceSecondScreenInteractorOutPutProtocol?
    
    func getPaymentMethodsForMobile() {
        merchantWorker.getPaymentMethodsForMobile { results in
            switch results {
            case .success(let resp):
                if resp?.isError == false {
                    if let unwrappedMethods = resp?.data {
                        self.presenter?.fetchedPaymentMethodsSucsesfully(methods: unwrappedMethods)
                    } else {
                        self.presenter?.failedToFetchPaymentMethods(err: "something went wrong")
                    }
                } else {
                    self.presenter?.failedToFetchPaymentMethods(err: "something went wrong")
                }
            case .failure(let err):
                self.presenter?.failedToFetchPaymentMethods(err: err.message)
            }
        }
    }
    
}
