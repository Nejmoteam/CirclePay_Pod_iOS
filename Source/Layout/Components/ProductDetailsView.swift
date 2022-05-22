//
//  ProductDetailsView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit
class ProductDetailsView: UIView {
    
    private lazy var productNameView: KeyValueView = {
        var container = KeyValueView(keyTitle: "Product Name")
        container.valueLabel.text = "120 EGP"
        container.keyLabel.textColor = ColorTypes.GrayPrimary800.value
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var productQuantityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "1 X 120 EGP"
        label.textColor = ColorTypes.GrayPrimary600.value
        label.font = UIFont(name: FontType.regularFont.name, size: 14)
        label.backgroundColor = .clear
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProductName()
        self.setupProductQuantityLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupProductName() {
        self.addSubview(self.productNameView)
        NSLayoutConstraint.activate([
            self.productNameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.productNameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.productNameView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.productNameView.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    private func setupProductQuantityLabel() {
        self.addSubview(self.productQuantityLabel)
        NSLayoutConstraint.activate([
            self.productQuantityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            self.productQuantityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.productQuantityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.productNameView.heightAnchor.constraint(equalToConstant: 24)
            
        ])
    }
    
}
