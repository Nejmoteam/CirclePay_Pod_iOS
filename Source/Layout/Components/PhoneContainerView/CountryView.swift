//
//  CountryView.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit

class CountryView: UIView {
    lazy var country: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontType.regularFont.name, size: 14)
        label.textColor = ColorTypes.GrayPrimary600.value
      //  label.setupAlignment()
        label.text = "🇪🇬  +20"
        return label
    }()

    lazy var arrowDown: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Arrow",
                                  in: Bundle(for: type(of:self)),
                                  compatibleWith: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUserInterface()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUserInterface() {
        addSubviews()
        setupCountryConstraints()
        setupArrowDownConstraints()
    }

    private func addSubviews() {
        addSubview(country)
        addSubview(arrowDown)
    }

    private func setupCountryConstraints() {
        NSLayoutConstraint.activate([
            country.heightAnchor.constraint(equalToConstant: 36),
            country.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            country.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        country.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
    }

    private func setupArrowDownConstraints() {
        NSLayoutConstraint.activate([
            arrowDown.widthAnchor.constraint(equalToConstant: 10),
            arrowDown.heightAnchor.constraint(equalToConstant: 5),
            arrowDown.leadingAnchor.constraint(equalTo: country.trailingAnchor, constant: 6),
            arrowDown.trailingAnchor.constraint(equalTo: trailingAnchor),
            arrowDown.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

