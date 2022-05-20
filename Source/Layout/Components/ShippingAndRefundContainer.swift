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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSepratorView()
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
    
}
