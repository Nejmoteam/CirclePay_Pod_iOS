//
//  PaymentMethodCell.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit

class PaymentMethodCell: UITableViewCell {
    lazy var containerView: UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupContainerView()
        self.selectionStyle = .none
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContainerView() {
        self.addSubview(self.containerView)
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 32),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),

        ])
    }
}


