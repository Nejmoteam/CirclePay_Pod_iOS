//
//  ShippingPolicyPresenter.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class ShippingPolicyPresenter: ShippingPolicyPresenterProtocol, ShippingPolicyInteractorOutPutProtocol {
    weak var view: ShippingPolicyViewProtocol?
    private let interactor: ShippingPolicyInteractorInPutProtocol
    private let router: ShippingPolicyRouterProtocol
    private var shippingPolicy: String
    init(view: ShippingPolicyViewProtocol, interactor: ShippingPolicyInteractorInPutProtocol, router: ShippingPolicyRouterProtocol, shippingPolicy: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.shippingPolicy = shippingPolicy
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        if let unwrappedConfigs = CirclePay.uiConfigs {
            if let color = unwrappedConfigs.color {
                self.view?.setupPrimaryColorConfiguration(colorString: color)
            }
        }
        self.view?.setupShippingPolicy(shippingPolicy: self.shippingPolicy)
    }
    
    func dismissViewController() {
        self.router.dismissViewController()
    }
}
