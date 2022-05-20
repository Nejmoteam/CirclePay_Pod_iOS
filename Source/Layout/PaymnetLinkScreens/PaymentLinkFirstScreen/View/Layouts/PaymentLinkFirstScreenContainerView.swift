//
//  PaymentLinkFirstScreenContainerView.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class PaymentLinkFirstScreenContainerView: PaymentBaseClass {
    
    private lazy var logoView: LogoContainerView = {
        let logoContainer = LogoContainerView()
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        return logoContainer
    }()
    
    private lazy var stepsView: StepsView = {
        let stepsViewContainer = StepsView()
        stepsViewContainer.translatesAutoresizingMaskIntoConstraints = false
        return stepsViewContainer
    }()
    
    private lazy var paymentSummeryTitleContainer: TitleViewContainer = {
        let titleContainer = TitleViewContainer()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.titleLabel.text = "Payment Summery"
        return titleContainer
    }()
    
    private lazy var billedFromView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Billed From :")
        container.valueLabel.text = "Mahmoud Allam"
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var billedToView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Billed To :")
        container.valueLabel.text = "CirclePay Inc"
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var totalAmountView: TotalAmountViewContainer = {
        var container = TotalAmountViewContainer()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var subTotalView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Sub Total :")
        container.valueLabel.text = "120 EGP"
        container.keyLabel.font = UIFont.systemFont(ofSize: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var taxView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Tax (14%) :")
        container.valueLabel.text = "45 EGP"
        container.keyLabel.font = UIFont.systemFont(ofSize: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var shippingView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Shipping :")
        container.valueLabel.text = "35 EGP"
        container.keyLabel.font = UIFont.systemFont(ofSize: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var discuntView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Discount (5%) :")
        container.valueLabel.text = "120 EGP"
        container.keyLabel.font = UIFont.systemFont(ofSize: 16)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var cupponView: CupponView = {
        var view = CupponView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var productDetailsView: ProductDetailsView = {
        var view = ProductDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var shippingRefundButtonContainer: ShippingAndRefundContainer = {
        var view = ShippingAndRefundContainer()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nextButtonContainer: ButtonsContainerView = {
        let button = ButtonsContainerView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: PaymentLinkFirstScreenPresenterProtocol
    
    init(presenter:PaymentLinkFirstScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        self.addLogoImageView()
        self.addStepsView()
        self.addSummeryTitleContainerView()
        self.setupBilledFromView()
        self.setupBilledToView()
        self.setupTotalAmountView()
        self.setupSubTotalView()
        self.setupTaxView()
        self.setupShippingView()
        self.setupDiscountView()
        self.setupCupponView()
        self.addProductDetailsView()
        self.setupShippingRefundView()
        self.addNextButtonContainer()
        
        //Testing UI
        self.logoView.isHidden = true
        self.shippingRefundButtonContainer.isHidden = true
        self.totalAmountView.isHidden = true
        self.productDetailsView.isHidden = true
    }

    private func addLogoImageView() {
        self.logoView.heightAnchor.constraint(equalToConstant: 47 + 32).isActive = true
        self.vStackView.addArrangedSubview(self.logoView)
    }
    
    private func addStepsView() {
        self.stepsView.heightAnchor.constraint(equalToConstant: 24 + 32).isActive = true
        self.vStackView.addArrangedSubview(self.stepsView)
        
    }
    
    private func addSummeryTitleContainerView() {
        self.paymentSummeryTitleContainer.heightAnchor.constraint(equalToConstant: 24 + 17).isActive = true
        self.vStackView.addArrangedSubview(self.paymentSummeryTitleContainer)
        
    }
    
    private func setupBilledFromView() {
        
        self.billedFromView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.billedFromView)
        
    }
    
    private func setupBilledToView() {
        self.billedToView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.vStackView.addArrangedSubview(self.billedToView)
    }
    
    private func setupTotalAmountView() {
        self.totalAmountView.heightAnchor.constraint(equalToConstant: 86).isActive = true
        self.vStackView.addArrangedSubview(self.totalAmountView)
    }
    
    
    
    private func setupSubTotalView() {
        self.subTotalView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.subTotalView)
    }
    
    private func setupTaxView() {
        self.taxView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.taxView)
    }
    
    private func setupShippingView() {
        self.shippingView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.shippingView)
    }
    
    private func setupDiscountView() {
        self.discuntView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.vStackView.addArrangedSubview(self.discuntView)
    }
    
    private func setupCupponView() {
        self.cupponView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        self.vStackView.addArrangedSubview(self.cupponView)
        
    }
    
    private func addProductDetailsView() {
        self.productDetailsView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        self.vStackView.addArrangedSubview(self.productDetailsView)
    }
    
    private func setupShippingRefundView() {
        self.shippingRefundButtonContainer.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.vStackView.addArrangedSubview(self.shippingRefundButtonContainer)
        let sepratorView = UIView()
        sepratorView.translatesAutoresizingMaskIntoConstraints = false
        sepratorView.backgroundColor = .clear
        
        sepratorView.heightAnchor.constraint(equalToConstant: 47).isActive = true
        self.vStackView.addArrangedSubview(sepratorView)
        
    }
    private func addNextButtonContainer() {
        self.nextButtonContainer.heightAnchor.constraint(equalToConstant: 36 + 61).isActive = true
        self.vStackView.addArrangedSubview(self.nextButtonContainer)
    }
}
