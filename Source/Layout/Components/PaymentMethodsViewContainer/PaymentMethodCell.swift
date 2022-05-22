//
//  PaymentMethodCell.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit

class PaymentMethodCell: UITableViewCell {
    lazy var paymentSelectioanView: PaymentSelectionView = {
        var view = PaymentSelectionView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.shadowWithCorner(cornerRadius: 8, shadowRaduis: 2, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07510456818), opacity: 1, offset: CGSize(width: 1, height: 1))
        
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
        self.addSubview(self.paymentSelectioanView)
        NSLayoutConstraint.activate([
            self.paymentSelectioanView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            self.paymentSelectioanView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 32),
            self.paymentSelectioanView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            self.paymentSelectioanView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
        ])
    }
}




extension UIView {
    func shadowWithCorner(cornerRadius: CGFloat, shadowRaduis: CGFloat, shadowColor: UIColor, opacity: Float, offset: CGSize) {
        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadowRaduis
        layer.shouldRasterize = false
    }
}
