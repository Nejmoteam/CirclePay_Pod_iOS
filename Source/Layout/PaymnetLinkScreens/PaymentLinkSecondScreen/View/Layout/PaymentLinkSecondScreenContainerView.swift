//
//  PaymentLinkSecondScreenContainerView.swift
//  Pods
//
//  Created Alchemist on 22/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class PaymentLinkSecondScreenContainerView: PaymentBaseClass {
    
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
        titleContainer.titleLabel.text = "Customer Data"
        titleContainer.titleLabel.font = UIFont(name: FontType.boldFont.name, size: 20)
        return titleContainer
    }()
    
    private lazy var fullDataView: FullNameDataView = {
        var container = FullNameDataView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var contactsView: ContactsView = {
        var container = ContactsView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var addressDetailsView: AddressDetailsView = {
        var container = AddressDetailsView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    
    private lazy var selectPaymentMethodTitleView: TitleViewContainer = {
        let titleContainer = TitleViewContainer()
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        titleContainer.titleLabel.text = "Select Payment Method"
        titleContainer.titleLabel.font = UIFont(name: FontType.boldFont.name, size: 20)
        return titleContainer
    }()
    
    lazy var payButtonContainer: ButtonsContainerView = {
        let button = ButtonsContainerView()
//        button.nextButton.addTarget(self, action: #selector(didTappedNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var paymentMethodsView: PaymentMethodsViewContainer = {
        let button = PaymentMethodsViewContainer()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    var presenter: PaymentLinkSecondScreenPresenterProtocol
    
    init(presenter:PaymentLinkSecondScreenPresenterProtocol) {
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
        self.addFullDataView()
        self.addContactsView()
        self.addAddressDetailsView()
        self.addSelectPaymentMethodTitleView()
        self.addPayButtonContainer()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.injectPaymentMethodView()
        }
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
    
    private func addFullDataView() {
        self.fullDataView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.vStackView.addArrangedSubview(self.fullDataView)
        
    }
    
    private func addContactsView() {
        self.contactsView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.vStackView.addArrangedSubview(self.contactsView)
        
    }
    
    private func addAddressDetailsView() {
        self.addressDetailsView.heightAnchor.constraint(equalToConstant: 192).isActive = true
        self.vStackView.addArrangedSubview(self.addressDetailsView)
        
    }
    
    private func addSelectPaymentMethodTitleView() {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.vStackView.addArrangedSubview(view)
        self.selectPaymentMethodTitleView.heightAnchor.constraint(equalToConstant: 24 + 17).isActive = true
        self.vStackView.addArrangedSubview(self.selectPaymentMethodTitleView)
    }
    
    private func addPayButtonContainer() {
        self.payButtonContainer.heightAnchor.constraint(equalToConstant: 36 + 61).isActive = true
        self.vStackView.addArrangedSubview(self.payButtonContainer)
    }
    
    private func injectPaymentMethodView() {
        let paymentMethodsCount: CGFloat = 4
        let height : CGFloat = paymentMethodsCount * 66 + 32
        
        self.paymentMethodsView.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.vStackView.insertArrangedSubview(paymentMethodsView, at: self.vStackView.arrangedSubviews.count - 1)
        self.paymentMethodsView.tableView.reloadData()
    }
}



