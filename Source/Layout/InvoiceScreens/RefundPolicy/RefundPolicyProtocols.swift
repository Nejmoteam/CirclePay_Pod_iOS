//
//  RefundPolicyProtocols.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol RefundPolicyViewProtocol: class {
    var presenter: RefundPolicyPresenterProtocol! {get set}
    func setupRefundPolicy(refundPolicy: String)
    func setupPrimaryColorConfiguration(colorString: String)

}
protocol RefundPolicyPresenterProtocol {
    var view: RefundPolicyViewProtocol? {get set}
    func viewDidLoad()
    func dismissViewController()
}
protocol RefundPolicyRouterProtocol {
    func dismissViewController()
}
protocol RefundPolicyInteractorInPutProtocol {
    var presenter: RefundPolicyInteractorOutPutProtocol? {get set}
}
protocol RefundPolicyInteractorOutPutProtocol:class {
}
