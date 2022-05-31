//
//  InvoiceFirstScreenViewController.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
import Kingfisher
class InvoiceFirstScreenViewController: UIViewController, InvoiceFirstScreenViewProtocol {
    
    var presenter: InvoiceFirstScreenPresenterProtocol!
    lazy var containerView : InvoiceFirstScreenContainerView = {
        var view = InvoiceFirstScreenContainerView(presenter: self.presenter)
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
    
    
    func configurePaymentSummery(billedFrom: String, billedTo: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.billedFromView.valueLabel.text = billedFrom
            self.containerView.billedToView.valueLabel.text = billedTo
            
        }
    }
    
    func configureSubTotal(subTotal: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.subTotalView.valueLabel.text = subTotal  + " EGP"
        }
    }
    
    
    func configureShipping(shippingValue: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.shippingView.valueLabel.text = shippingValue + " EGP"
        }
    }
    func configureDiscount(discountType: DiscountTypes, discountValue:String,  value: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.discuntView.valueLabel.text = value + " EGP"
            if discountType == .percentage {
                self.containerView.discuntView.keyLabel.text = "Discount (\(discountValue))%"
            } else {
                self.containerView.discuntView.keyLabel.text = "Discount"
            }

        }

    }

    func configureInvoiceDate(date: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.invoiceDetails.productQuantityLabel.text = "Valid till " + date
        }
    }
    
    func configureTaxView(taxValue: String, taxPersentage: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.taxView.keyLabel.text = "Tax (\(taxPersentage))%"
            self.containerView.taxView.valueLabel.text = taxValue + " EGP"
            
        }
    }
    
    func configureTotal(total: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.totalAmountView.keyValueViewContainer.valueLabel.text = total + " EGP"
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
            self.containerView.paymentSummeryTitleContainer.titleLabel.textColor = color
            self.containerView.stepsView.stepOneView.stepNumberLabel.backgroundColor = color
            self.containerView.stepsView.stepTwoView.stepNumberLabel.backgroundColor = color.withAlphaComponent(0.2)
            self.containerView.shippingRefundButtonContainer.refundPolicyButton.setTitleColor(color, for: .normal)
            self.containerView.shippingRefundButtonContainer.shippingPolicyButton.setTitleColor(color, for: .normal)
            self.containerView.nextButtonContainer.nextButton.backgroundColor = color
        }
    }
    
    func setupBilledFromConfiguration(isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.billedFromView.isHidden = !isEnabled
        }
    }
    
    func setupBilledToConfiguration(isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.billedToView.isHidden = !isEnabled

        }
    }
    
    func setupTotalAmountConfiguration(isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.totalAmountView.isHidden = !isEnabled

        }
    }
    
    func setupAccountingConfiguration(isEnabled:Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.subTotalView.isHidden = !isEnabled
            self.containerView.taxView.isHidden = !isEnabled
            self.containerView.shippingView.isHidden = !isEnabled
            self.containerView.discuntView.isHidden = !isEnabled
            self.containerView.cupponView.bottomSeprator.isHidden = !isEnabled
        }
    }
    
    func setupShippingPolicyConfiguration(isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.shippingRefundButtonContainer.shippingPolicyButton.isHidden = !isEnabled
        }
    }
    
    func setupRefundPolicyConfiguration(isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.containerView.shippingRefundButtonContainer.refundPolicyButton.isHidden = !isEnabled

        }
    }
    
    
    
}
