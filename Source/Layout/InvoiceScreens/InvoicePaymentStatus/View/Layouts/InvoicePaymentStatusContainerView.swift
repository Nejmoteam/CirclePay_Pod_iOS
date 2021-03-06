//
//  InvoicePaymentStatusContainerView.swift
//  Pods
//
//  Created apple on 06/06/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoicePaymentStatusContainerView: UIView {
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var logoView: LogoContainerView = {
        let logoContainer = LogoContainerView()
        logoContainer.translatesAutoresizingMaskIntoConstraints = false
        return logoContainer
    }()
    
    lazy var statusImageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontType.boldFont.name, size: 20)
        label.textColor = ColorTypes.PrimaryMain700.value
        label.textAlignment = .center
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontType.regularFont.name, size: 14)
        label.textColor = ColorTypes.GrayPrimary700.value
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    lazy var inoviceDetailsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View invoice details >", for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.regularFont.name, size: 18)
        button.setTitleColor(ColorTypes.GrayPrimary600.value, for: .normal)
        button.addTarget(self, action: #selector(userPressedInvoiceDetails), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    lazy var invoiceNumberView: KeyValueView = {
        let view = KeyValueView(keyTitle: "Invoice number")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyLabel.font = UIFont(name: FontType.regularFont.name, size: 14)
        view.keyLabel.textColor = ColorTypes.GrayPrimary500.value
        view.valueLabel.font = UIFont(name: FontType.mediumFont.name, size: 14)
        view.valueLabel.textColor = ColorTypes.GrayPrimary600.value
        view.valueLabel.text = ""
        return view
    }()
    
    lazy var paymentDateView: KeyValueView = {
        let view = KeyValueView(keyTitle: "Payment date")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyLabel.font = UIFont(name: FontType.regularFont.name, size: 14)
        view.keyLabel.textColor = ColorTypes.GrayPrimary500.value
        view.valueLabel.font = UIFont(name: FontType.mediumFont.name, size: 14)
        view.valueLabel.textColor = ColorTypes.GrayPrimary600.value
        view.valueLabel.text = ""
        return view
    }()
    
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Download Invoice", for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.mediumFont.name, size: 18)
        button.setTitleColor(ColorTypes.GrayPrimary0.value, for: .normal)
        button.backgroundColor = ColorTypes.PrimaryMain500.value
        button.addTarget(self, action: #selector(userPressedDownloadInvoice), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.isHidden = true
        return button
    }()
    
    lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Try Again!", for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.mediumFont.name, size: 18)
        button.setTitleColor(ColorTypes.PrimaryMain500.value, for: .normal)
        
        button.addTarget(self, action: #selector(userPressedTryAgian), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = ColorTypes.PrimaryMain500.value.cgColor
        button.clipsToBounds = true
        button.isHidden = true
        return button
    }()
    
    lazy var emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var presenter: InvoicePaymentStatusPresenterProtocol
    
    init(presenter:InvoicePaymentStatusPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        self.addSubViews()
        setupScrollView()
        setupContentView()
        setupLogoView()
        setupStatusImageView()
        setupTitleLabel()
        setupSubTitleLable()
        setupVStackView()
        setupInvoiceDetailsButton()
        setupEmptyView()
        setupInvoiceNumberView()
        setupPaymentDateView()
        setupDownloadButton()
        setupTryAgainButton()
    }
    private func addSubViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoView)
        contentView.addSubview(statusImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(vStackView)
        contentView.addSubview(downloadButton)
        contentView.addSubview(tryAgainButton)
    }
    
    private func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupContentView() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupLogoView() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            logoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 47 + 32)
        ])
    }
    
    private func setupStatusImageView() {
        NSLayoutConstraint.activate([
            statusImageView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 116),
            statusImageView.widthAnchor.constraint(equalToConstant: 255),
            statusImageView.heightAnchor.constraint(equalToConstant: 233),
            statusImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: statusImageView.bottomAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    private func setupSubTitleLable() {
        NSLayoutConstraint.activate([
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 43),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -43)
        ])
    }
    
    private func setupVStackView() {
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 14),
            vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32)
        ])
    }
    
    private func setupInvoiceDetailsButton() {
        inoviceDetailsButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        vStackView.addArrangedSubview(inoviceDetailsButton)
    }
    
    private func setupEmptyView() {
        emptyView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        vStackView.addArrangedSubview(emptyView)
    }
    
    private func setupInvoiceNumberView() {
        invoiceNumberView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        vStackView.addArrangedSubview(invoiceNumberView)
    }
    
    private func setupPaymentDateView() {
        paymentDateView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        vStackView.addArrangedSubview(paymentDateView)
    }
    
    private func setupDownloadButton() {
        NSLayoutConstraint.activate([
            downloadButton.widthAnchor.constraint(equalToConstant: 215),
            downloadButton.heightAnchor.constraint(equalToConstant: 50),
            downloadButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 38),
            downloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
        ])
    }
    
    private func setupTryAgainButton() {
        NSLayoutConstraint.activate([
            tryAgainButton.widthAnchor.constraint(equalToConstant: 215),
            tryAgainButton.heightAnchor.constraint(equalToConstant: 50),
            tryAgainButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tryAgainButton.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 38),
            tryAgainButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
        ])
    }
    
    func setupView(with status:InvoicePaymentStatus) {
        switch status {
        case .success:
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.statusImageView.image = UIImage(named: "InvoicePaidSuccess",
                                                     in: Bundle(for: type(of:self)),
                                                     compatibleWith: nil)
                self.titleLabel.text = "transaction Paid successfully."
                self.subTitleLabel.isHidden = true
                self.inoviceDetailsButton.isHidden = false
                self.emptyView.isHidden = false
                self.invoiceNumberView.isHidden = false
                self.paymentDateView.isHidden = false
                self.downloadButton.isHidden = false
                self.tryAgainButton.isHidden = true
            }
        case .failure:
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                self.statusImageView.image = UIImage(named: "InvoicePaidFailed",
                                                     in: Bundle(for: type(of:self)),
                                                     compatibleWith: nil)
                self.titleLabel.text = "Transaction Failed"
                self.subTitleLabel.text = "You can try again or contact the merchant for any further requests."
                self.subTitleLabel.isHidden = false
                self.inoviceDetailsButton.isHidden = true
                self.emptyView.isHidden = true
                self.invoiceNumberView.isHidden = true
                self.paymentDateView.isHidden = true
                self.downloadButton.isHidden = true
                self.tryAgainButton.isHidden = false
            }
        }
    }
    
    @objc private func userPressedTryAgian() {
        presenter.userPressedTryAgain()
    }
    
    @objc private func userPressedDownloadInvoice() {
        presenter.userPressedDownload()
    }
    
    @objc private func userPressedInvoiceDetails() {
        presenter.userPressedViewInvoiceDetails()
    }
}
