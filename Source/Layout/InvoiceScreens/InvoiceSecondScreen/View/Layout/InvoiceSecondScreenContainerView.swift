//
//  InvoiceSecondScreenContainerView.swift
//  Pods
//
//  Created Alchemist on 24/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceSecondScreenContainerView: PaymentBaseClass {
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
        let countryButton = UIButton()
        container.addSubview(countryButton)
        countryButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryButton.centerYAnchor.constraint(equalTo: container.selectCountryField.centerYAnchor),
            countryButton.centerXAnchor.constraint(equalTo: container.selectCountryField.centerXAnchor),
            countryButton.widthAnchor.constraint(equalTo: container.selectCountryField.widthAnchor),
            countryButton.heightAnchor.constraint(equalTo: container.selectCountryField.heightAnchor)
        ])
        countryButton.addTarget(self, action: #selector(didTappedCountryView), for: .touchUpInside)
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
        button.nextButton.setTitle("Pay", for: .normal)
        button.nextButton.addTarget(self, action: #selector(didTappedPay), for: .touchUpInside)
        button.nextButton.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var paymentMethodsView: PaymentMethodsViewContainer = {
        let button = PaymentMethodsViewContainer(presenter: self.presenter)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let countryPicker = CountryPrefixPicker()

    var presenter: InvoiceSecondScreenPresenterProtocol
    
    init(presenter:InvoiceSecondScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        countryPicker.delegate = self
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
    
    func injectPaymentMethodView() {
        let paymentMethodsCount: CGFloat = CGFloat(self.presenter.numberOfPaymentMethods())
        let height : CGFloat = paymentMethodsCount * 66 + 32
        
        self.paymentMethodsView.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.vStackView.insertArrangedSubview(paymentMethodsView, at: self.vStackView.arrangedSubviews.count - 1)
        self.paymentMethodsView.tableView.reloadData()
    }
    
    @objc func didTappedPay() {
        self.presenter.updatedCustomerData = GetCustomerCodable(firstName: self.fullDataView.firstNameTextField.text, lastName: self.fullDataView.lastNameTextField.text, email: self.contactsView.emailTextField.text, mobileNumber: nil, country: self.addressDetailsView.selectCountryField.text, governorate: nil, city: self.addressDetailsView.selectCityField.text, address: self.addressDetailsView.extraDetailsField.text, aptNumber: self.addressDetailsView.appartmentNumberField.text)
        self.presenter.onTapPay()
    }
    
    func setupCustomerData(customer: CustomerViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.fullDataView.firstNameTextField.text = customer.firstName
            self.fullDataView.lastNameTextField.text = customer.lastName
            self.contactsView.phoneTextFieldView.countryView.country.text = customer.countryCode
            self.contactsView.phoneTextFieldView.countryView.country.textColor = ColorTypes.GrayPrimary700.value
            self.contactsView.phoneTextFieldView.isUserInteractionEnabled = false
            let attributedString = NSMutableAttributedString(string: customer.phoneNumber)
            if attributedString.length > 2 {
                attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 2, length: 1))
            }
            if attributedString.length > 5 {
                attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 5, length: 1))
            }
            self.contactsView.phoneTextFieldView.phoneTextField.attributedText = attributedString
            self.contactsView.emailTextField.text = customer.email
            self.addressDetailsView.selectCountryField.text = customer.country
            self.addressDetailsView.selectCityField.text = customer.city
            self.addressDetailsView.appartmentNumberField.text = customer.aptNumber
            self.addressDetailsView.extraDetailsField.text = customer.extraDetails
        }
    }
    
    @objc func didTappedCountryView() {
        print("Country Tapped")
        self.showCountriesListView()
    }
    
    func showCountriesListView() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {
                return
            }
            self.countryPicker.frame = self.frame
            self.addSubview(self.countryPicker)
        }
    }
}




extension InvoiceSecondScreenContainerView: CountryPrefixPickerDelegate {
    func didSelectCountry(country: CountriesISO3166) {
        print(country.country)
        self.addressDetailsView.selectCountryField.text = country.country
        self.presenter.didChangeCountry(countryName: country.country)
       // presenter.didSelectCountry(country: country)
    }
}
