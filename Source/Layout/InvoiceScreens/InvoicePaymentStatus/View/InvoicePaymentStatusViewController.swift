//
//  InvoicePaymentStatusViewController.swift
//  Pods
//
//  Created apple on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoicePaymentStatusViewController: UIViewController, InvoicePaymentStatusViewProtocol {
    var presenter: InvoicePaymentStatusPresenterProtocol!
    lazy var containerView : InvoicePaymentStatusContainerView = {
        var view = InvoicePaymentStatusContainerView(presenter: self.presenter)
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
    
    func setupView(with status:InvoicePaymentStatus) {
        self.containerView.setupView(with: status)
    }
    
    private func dimissAllCheckOutEmbed() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.dismissAll(animated: true)
        }
    }
    
    func setInvoiceNumber(value: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.invoiceNumberView.valueLabel.text = value
        }
    }
    
    func setInvoicePaymentDate(value: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.paymentDateView.valueLabel.text = value
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
            self.containerView.titleLabel.textColor = color
            self.containerView.downloadButton.backgroundColor = color
            self.containerView.dismissButton.setTitleColor(color, for: .normal)
            self.containerView.tryAgainButton.setTitleColor(color, for: .normal)
            self.containerView.tryAgainButton.layer.borderColor = color.cgColor
        }
    }
}
