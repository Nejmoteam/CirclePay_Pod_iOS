//
//  InvoiceSecondScreenViewController.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
import SafariServices

class InvoiceSecondScreenViewController: UIViewController, InvoiceSecondScreenViewProtocol {
    var presenter: InvoiceSecondScreenPresenterProtocol!
    lazy var containerView : InvoiceSecondScreenContainerView = {
        var view = InvoiceSecondScreenContainerView(presenter: self.presenter)
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
        self.disablePayButton()
    }
    
    func reloadPaymentMethodsData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.injectPaymentMethodView()
            self.containerView.paymentMethodsView.tableView.reloadData()
        }
    }
    
    func setupCustomerData(customer: CustomerViewModel) {
        self.containerView.setupCustomerData(customer: customer)
    }
    
    func showLoadingForPayButton() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.payButtonContainer.nextButton.showLoading()
        }

    }
    
    func hideLoadingForPayButton() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.payButtonContainer.nextButton.hideLoading(with: "Pay")
        }
    }
    
    func enablePayButton() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.payButtonContainer.nextButton.alpha = 1
            self.containerView.payButtonContainer.nextButton.isEnabled = true
        }
    }
    
    func disablePayButton() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.payButtonContainer.nextButton.alpha = 0.4
            self.containerView.payButtonContainer.nextButton.isEnabled = false
        }
    }
    func openIframeViaSafari(iframeUrl: String) {
        if let safariController = self.openSafari(withURL: iframeUrl) {
            self.present(safariController, animated: true, completion: nil)
        }
    }
    
    private func  openSafari(withURL url: String) -> UIViewController? {
        if let resourceUrl = URL(string: url) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: resourceUrl, configuration: config)
            return vc
        }
        return nil
    }
}
