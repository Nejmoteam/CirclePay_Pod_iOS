//
//  PaymentLinkSecondScreenProtocols.swift
//  Pods
//
//  Created Alchemist on 22/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol PaymentLinkSecondScreenViewProtocol: AnyObject {
    var presenter: PaymentLinkSecondScreenPresenterProtocol! {get set}
}
protocol PaymentLinkSecondScreenPresenterProtocol {
    var view: PaymentLinkSecondScreenViewProtocol? {get set}
    func viewDidLoad()
}
protocol PaymentLinkSecondScreenRouterProtocol {
}
protocol PaymentLinkSecondScreenInteractorInPutProtocol {
    var presenter: PaymentLinkSecondScreenInteractorOutPutProtocol? {get set}
}
protocol PaymentLinkSecondScreenInteractorOutPutProtocol:AnyObject {
}
