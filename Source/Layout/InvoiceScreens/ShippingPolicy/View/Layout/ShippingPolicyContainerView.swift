//
//  ShippingPolicyContainerView.swift
//  Pods
//
//  Created Alchemist on 30/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class ShippingPolicyContainerView: UIView {
    var presenter: ShippingPolicyPresenterProtocol
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.shadowWithCorner(cornerRadius: 5, shadowRaduis: 2, shadowColor: #colorLiteral(red: 0.1921568627, green: 0.3921568627, blue: 0.9529411765, alpha: 0.08), opacity: 1, offset: CGSize(width: 1, height: 1))
        view.backgroundColor = ColorTypes.GrayPrimary100.value
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = ColorTypes.PrimaryMain500.value
        label.text = "Shipping Policy"
        label.font = UIFont(name: FontType.mediumFont.name, size: 22)
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: FontType.regularFont.name, size: 16)
        textView.textColor = ColorTypes.GrayPrimary700.value
        textView.isEditable = false
        textView.isSelectable = false
        textView.showsVerticalScrollIndicator = false
        textView.text = ""
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        textView.backgroundColor = ColorTypes.GrayPrimary100.value
        return textView
    }()
    
    lazy var closeButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Close",
                                in: Bundle(for: type(of:self)),
                                compatibleWith: nil), for: .normal)
        button.imageView?.contentMode = .center
        button.addTarget(self, action: #selector(closeButtonTarget), for: .touchUpInside)
        return button
    }()
    
    init(presenter:ShippingPolicyPresenterProtocol) {
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
        self.setupContainerViewContainer()
        self.setupTitleLabel()
        self.setupCloseButton()
        self.setupTextView()
    }
    private func addSubViews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.titleLabel)
        self.containerView.addSubview(self.closeButton)
        self.containerView.addSubview(self.textView)
    }
    
    
    private func setupContainerViewContainer() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 32),
            titleLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 32),
//            titleLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -32)
        ])
    }
    
    private func setupCloseButton() {
        NSLayoutConstraint.activate([
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -32)
        ])
    }
    func setupTextView() {
        NSLayoutConstraint.activate([
            self.textView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 23 ),
            self.textView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 14),
            self.textView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -14),
            self.textView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -23)

        ])
    }
    @objc func closeButtonTarget() {
        self.presenter.dismissViewController()
    }
    
}
