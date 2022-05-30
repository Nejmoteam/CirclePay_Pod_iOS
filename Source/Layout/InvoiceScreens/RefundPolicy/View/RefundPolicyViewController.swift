//
//  RefundPolicyViewController.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class RefundPolicyViewController: UIViewController, RefundPolicyViewProtocol {
    var presenter: RefundPolicyPresenterProtocol!
    lazy var containerView : RefundPolicyContainerView = {
        var view = RefundPolicyContainerView(presenter: self.presenter)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        super.loadView()
        self.view = containerView
    }
    
    func setupRefundPolicy(refundPolicy: String) {
        self.containerView.textView.text = refundPolicy
    }
}
