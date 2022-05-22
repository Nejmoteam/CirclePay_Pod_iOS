//
//  PaymentLinkFirstScreenProtocols.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol PaymentLinkFirstScreenViewProtocol: class {
    var presenter: PaymentLinkFirstScreenPresenterProtocol! {get set}
}
protocol PaymentLinkFirstScreenPresenterProtocol {
    var view: PaymentLinkFirstScreenViewProtocol? {get set}
    func viewDidLoad()
    func navigateToStepTwo()
}
protocol PaymentLinkFirstScreenRouterProtocol {
    func navigateToStepTwo()
}
protocol PaymentLinkFirstScreenInteractorInPutProtocol {
    var presenter: PaymentLinkFirstScreenInteractorOutPutProtocol? {get set}
}
protocol PaymentLinkFirstScreenInteractorOutPutProtocol:class {
}
