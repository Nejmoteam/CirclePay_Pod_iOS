//
//  ShippingAndRefundContainer.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit
class ShippingAndRefundContainer: UIView {
    
    lazy var sepratorView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary500.value
        return view
    }()
    
    lazy var shippingPolicyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shipping Policy", for: .normal)
        button.setTitleColor(ColorTypes.PrimaryMain400.value, for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.regularFont.name, size: 16)
        return button
    }()
    
    lazy var refundPolicyButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Refund Policy", for: .normal)
        button.setTitleColor(ColorTypes.PrimaryMain400.value, for: .normal)
        button.titleLabel?.font = UIFont(name: FontType.regularFont.name, size: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSepratorView()
        self.setupShippingButton()
        self.setupRefundButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSepratorView() {
        self.addSubview(self.sepratorView)
        NSLayoutConstraint.activate([
            self.sepratorView.topAnchor.constraint(equalTo: self.topAnchor),
            self.sepratorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.sepratorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.sepratorView.heightAnchor.constraint(equalToConstant: 1)
            
        ])
    }
    
    private func setupShippingButton() {
        self.addSubview(self.shippingPolicyButton)
        NSLayoutConstraint.activate([
            self.shippingPolicyButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.shippingPolicyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.shippingPolicyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        
        ])
    }
    private func setupRefundButton() {
        self.addSubview(self.refundPolicyButton)
        NSLayoutConstraint.activate([
            self.refundPolicyButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.refundPolicyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.refundPolicyButton.leadingAnchor.constraint(equalTo: self.shippingPolicyButton.trailingAnchor, constant: 24)
        
        ])
    }
    
}
