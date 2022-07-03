//
//  RefundPolicyPresenter.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^

import Foundation
class RefundPolicyPresenter: RefundPolicyPresenterProtocol, RefundPolicyInteractorOutPutProtocol {
    weak var view: RefundPolicyViewProtocol?
    private let interactor: RefundPolicyInteractorInPutProtocol
    private let router: RefundPolicyRouterProtocol
    var refundPolicy: String
    init(view: RefundPolicyViewProtocol, interactor: RefundPolicyInteractorInPutProtocol, router: RefundPolicyRouterProtocol,refundPolicy: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.refundPolicy = refundPolicy
    }
    func viewDidLoad() {
        print("ViewDidLoad")
        if let unwrappedConfigs = CirclePay.uiConfigs {
            if let color = unwrappedConfigs.color {
                self.view?.setupPrimaryColorConfiguration(colorString: color)
            }
        }
        self.view?.setupRefundPolicy(refundPolicy: self.refundPolicy)
   

    }
    func dismissViewController() {
        self.router.dismissViewController()
    }
}
