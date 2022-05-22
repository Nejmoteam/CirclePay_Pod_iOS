//
//  LogoContainerView.swift
//  Pods
//
//  Created by Alchemist on 20/05/2022.
//

import Foundation
import UIKit

class LogoContainerView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Logo",
                                  in: Bundle(for: type(of:self)),
                                  compatibleWith: nil)
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLogoImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLogoImageView() {
        self.addSubview(self.logoImageView)
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 168)
            
        ])
    }
}

