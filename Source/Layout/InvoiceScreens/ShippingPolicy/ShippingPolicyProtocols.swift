//
//  ShippingPolicyProtocols.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import Foundation
protocol ShippingPolicyViewProtocol: AnyObject {
    var presenter: ShippingPolicyPresenterProtocol! {get set}
    func setupShippingPolicy(shippingPolicy: String)
    func setupPrimaryColorConfiguration(colorString: String)

}
protocol ShippingPolicyPresenterProtocol {
    var view: ShippingPolicyViewProtocol? {get set}
    func viewDidLoad()
    func dismissViewController()
}
protocol ShippingPolicyRouterProtocol {
    func dismissViewController()
}
protocol ShippingPolicyInteractorInPutProtocol {
    var presenter: ShippingPolicyInteractorOutPutProtocol? {get set}
}
protocol ShippingPolicyInteractorOutPutProtocol:AnyObject {
}
