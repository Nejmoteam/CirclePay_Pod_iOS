//
//  PhoneContainerView.swift
//  CirclePay_Pod_iOS
//
//  Created by Alchemist on 22/05/2022.
//

import Foundation
import UIKit

class PhoneContainerView: UIView {
    lazy var countryView: CountryView = {
        let view = CountryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTypes.GrayPrimary600.value
        return view
    }()

    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = ColorTypes.GrayPrimary700.value
        textField.placeholder = "123  456  7890"
        textField.borderStyle = .none
        textField.textContentType = .telephoneNumber
        textField.keyboardType = .phonePad
        textField.font = UIFont(name: FontType.regularFont.name, size: 14)
        textField.addTarget(self, action: #selector(textFieldEdidtingDidChange(_:)), for: .editingChanged)
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUserInterface()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterface() {
        addSubViews()
        setupCountryViewConstraints()
        setupLineConstraints()
        setupPhoneTextFieldConstraints()
    }

    private func addSubViews() {
        self.addSubview(countryView)
        self.addSubview(line)
        self.addSubview(phoneTextField)
    }

    private func setupCountryViewConstraints() {
        NSLayoutConstraint.activate([
            countryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            countryView.topAnchor.constraint(equalTo: topAnchor),
            countryView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupLineConstraints() {
        NSLayoutConstraint.activate([
            line.widthAnchor.constraint(equalToConstant: 1),
            line.leadingAnchor.constraint(equalTo: countryView.trailingAnchor, constant: 13),
            line.topAnchor.constraint(equalTo: topAnchor, constant: 6.5),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6.5)
        ])
    }

    private func setupPhoneTextFieldConstraints() {
        NSLayoutConstraint.activate([
            phoneTextField.leadingAnchor.constraint(equalTo: line.trailingAnchor, constant: 13),
            phoneTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            phoneTextField.topAnchor.constraint(equalTo: topAnchor),
            phoneTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        phoneTextField.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
    }

    @objc func textFieldEdidtingDidChange(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        let finalDigit = text.replacedArabicDigitsWithEnglish
        let attributedString = NSMutableAttributedString(string: finalDigit)

        if finalDigit.first != "0", attributedString.length > 2 {
            attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 2, length: 1))
        }
        if finalDigit.first == "0", attributedString.length > 3 {
            attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 3, length: 1))
        }
        if finalDigit.first != "0", attributedString.length > 5 {
            attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 5, length: 1))
        }
        if finalDigit.first == "0", attributedString.length > 6 {
            attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(8.0), range: NSRange(location: 6, length: 1))
        }

        textField.attributedText = attributedString
    }
}

extension String {
    func hasCharacter(in characterSet: CharacterSet) -> Bool {
        rangeOfCharacter(from: characterSet) != nil
    }

    func getEstimatedFrameForText(width: CGFloat, font: UIFont) -> CGRect {
        let size = CGSize(width: width, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
    }

    func getEstimatedFrameWidthForText(height: CGFloat, font: UIFont) -> CGRect {
        let size = CGSize(width: 1000, height: height)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: font], context: nil)
    }

    public var replacedArabicDigitsWithEnglish: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
}

