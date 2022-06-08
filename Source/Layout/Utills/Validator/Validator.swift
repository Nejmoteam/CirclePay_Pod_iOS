//
//  Validator.swift
//  Alamofire
//
//  Created by Alchemist on 08/06/2022.
//

import Foundation
import UIKit
// MARK: - Validator Reposatory....

internal protocol AuthValidationManagerProtocol {
    // USER NAME VALIDATION.
    func isUserNameValid(_ userName: String) -> Bool
    func isEmailValid(_ email: String) -> Bool
    func validatePasswordField(password: String) -> Bool
    func isPhoneNumberValid(phoneNumber: String) -> Bool
    func isContainUpperCase(in text: String) -> Bool
    func isContainSpecialCharacter(in text: String) -> Bool
    func isValidLenth(in text: String) -> Bool
    func isContainsLowerCase(in text: String) -> Bool
    func isValidName(testStr:String) -> Bool 
}

internal class AuthValidationManager: AuthValidationManagerProtocol {
    func isUserNameValid(_ userName: String) -> Bool {
        let RegEx = "\\w{4,50}"
        let Test = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return Test.evaluate(with: userName)
    }

    func isEmailValid(_ email: String) -> Bool {
        __emailPredicate.evaluate(with: email)
    }

    func validatePasswordField(password: String) -> Bool {
        if password.count > 7 {
            return true
        }
        return false
    }

    func isPhoneNumberValid(phoneNumber: String) -> Bool {
        var isValid = true
        let nameValidation = phoneNumber.replacingOccurrences(of: " ", with: "")
        if nameValidation.count < 9 || nameValidation.count > 14 { // check length limitation
            isValid = false
        }
        return isValid
    }

    func isContainUpperCase(in text: String) -> Bool {
        let capitalLetterRegEx = ".*[A-Z]+.*"
        let textToTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
        return textToTest.evaluate(with: text)
    }

    func isContainSpecialCharacter(in text: String) -> Bool {
        let specialCharacterRegEx = ".*[!&^%$#@()/_*+-]+.*"
        let textToTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
        return textToTest.evaluate(with: text)
    }

    func isValidLenth(in text: String) -> Bool {
        let minimumCount = text.count >= 8
        let maximumCount = text.count < 25
        guard minimumCount, maximumCount else {
            return false
        }
        return true
    }

    func isContainsLowerCase(in text: String) -> Bool {
        text.hasCharacter(in: .lowercaseLetters)
    }
    
    func isValidName(testStr:String) -> Bool {
        guard testStr.count > 7, testStr.count < 18 else { return false }

        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: testStr)
    }
}

var firstPart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
var serverPart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
var __emailRegex = firstPart + "@" + serverPart + "[A-Za-z]{2,6}"
var __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)

extension String {
    func hasCharacter(in characterSet: CharacterSet) -> Bool {
        rangeOfCharacter(from: characterSet) != nil
    }
}
