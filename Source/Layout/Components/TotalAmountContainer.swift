//
//  TotalAmountContainer.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class TotalAmountViewContainer: UIView {
    private lazy var keyValueViewContainer: KeyValueView = {
        var container = KeyValueView(keyTitle: "Total Amount")
        container.valueLabel.text = "120 EGP"
        container.keyLabel.font = UIFont.systemFont(ofSize: 18)
        container.valueLabel.font = UIFont.systemFont(ofSize: 20)
        container.bottomSeprator.isHidden = false
        container.topSeprator.isHidden = false
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupKeyValueViewContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupKeyValueViewContainer() {
        self.addSubview(self.keyValueViewContainer)
        NSLayoutConstraint.activate([
            self.keyValueViewContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.keyValueViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.keyValueViewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.keyValueViewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            
        ])
    }
}

