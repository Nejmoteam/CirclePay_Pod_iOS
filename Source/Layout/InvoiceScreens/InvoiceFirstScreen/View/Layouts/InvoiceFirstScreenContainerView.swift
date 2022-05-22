//
//  InvoiceFirstScreenContainerView.swift
//  Pods
//
//  Created apple on 19/05/2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//@Mahmoud Allam Templete ^_^
import UIKit
class InvoiceFirstScreenContainerView: PaymentBaseClass {
    var presenter: InvoiceFirstScreenPresenterProtocol
    
    init(presenter:InvoiceFirstScreenPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.layoutUserInterFace()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterFace() {
        self.addSubViews()
    }
    private func addSubViews() {
        for i in 0...100 {
            let view = UIView(frame: .zero)
            view.heightAnchor.constraint(equalToConstant: 20).isActive = true
            view.backgroundColor = .red
            self.vStackView.addArrangedSubview(view)
        }
    }
    
}
