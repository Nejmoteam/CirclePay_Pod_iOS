//
//  ShippingPolicyViewController.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class ShippingPolicyViewController: UIViewController, ShippingPolicyViewProtocol {
    var presenter: ShippingPolicyPresenterProtocol!
    lazy var containerView : ShippingPolicyContainerView = {
        var view = ShippingPolicyContainerView(presenter: self.presenter)
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
    
    func setupShippingPolicy(shippingPolicy: String) {
        self.containerView.textView.text = shippingPolicy
    }
    
    func setupPrimaryColorConfiguration(colorString: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let color = UIColor(hexString: colorString)
            self.containerView.titleLabel.textColor = color
        }
    }
}
