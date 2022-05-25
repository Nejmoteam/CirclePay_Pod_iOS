//
//  InvoiceDetailsProductTableViewCell.swift
//  CirclePay_Pod_iOS
//
//  Created by apple on 25/05/2022.
//

import Foundation
import UIKit

class InvoiceDetailsProductTableViewCell: UITableViewCell {
    private lazy var productDetailsView: ProductDetailsView = {
        var view = ProductDetailsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        layoutUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUserInterface() {
        addSubviews()
        setupProductDetailsView()
    }
    
    private func addSubviews() {
        contentView.addSubview(productDetailsView)
    }
    
    private func setupProductDetailsView() {
        NSLayoutConstraint.activate([
            self.productDetailsView.heightAnchor.constraint(equalToConstant: 90),
            self.productDetailsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.productDetailsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.productDetailsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.productDetailsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
