//
//  InvoiceSecondScreenViewController.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
import Kingfisher
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

    
    
    // UIConfiguration
    func setupLogoConfigurations(isLogoEnabled:Bool, logoUrl: String) {
        if isLogoEnabled {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.containerView.logoView.isHidden = !isLogoEnabled
                // get logo
                if let imageURL = URL(string: logoUrl) {
                    self.containerView.logoView.logoImageView.kf.setImage(with: imageURL)
                    self.containerView.logoView.logoImageView.clipsToBounds = true
                }
            }
        } else {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
            self.containerView.logoView.isHidden = true
            }
        }
    }
    
    func setupPrimaryColorConfiguration(colorString: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let color = UIColor(hexString: colorString)
            self.containerView.customerDataTitleContainer.titleLabel.textColor = color
            self.containerView.selectPaymentMethodTitleView.titleLabel.textColor = color
            self.containerView.payButtonContainer.nextButton.backgroundColor = color
            self.containerView.stepsView.stepOneView.stepNumberLabel.backgroundColor = color
            self.containerView.stepsView.stepTwoView.stepNumberLabel.backgroundColor = color.withAlphaComponent(0.2)
        }
    }
}
