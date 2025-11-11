//
//  SignUpViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/13/25.
//
import Combine
import Foundation

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var phoneNumber: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    @Published var isSignUpDataValid: Bool = false

    @Published private(set) var isFirstNameValid: Bool = false
    @Published private(set) var isLastNameValid: Bool = false
    @Published private(set) var isPhoneNumberValid: Bool = false
    @Published private(set) var isEmailValid: Bool = false
    @Published private(set) var isPasswordValid: Bool = false
    @Published private(set) var isConfirmPasswordValid: Bool = false

    init() {
        Publishers.CombineLatest3(
            Publishers.CombineLatest3($isFirstNameValid, $isLastNameValid, $isPhoneNumberValid),
            Publishers.CombineLatest3($isEmailValid, $isPasswordValid, $isConfirmPasswordValid),
            $errorMessage
        )
        .map { group1, group2, error in
            let (firstValid, lastValid, phoneValid) = group1
            let (emailValid, passwordValid, confirmValid) = group2
            return error == nil &&
                firstValid && lastValid &&
                phoneValid && emailValid &&
                passwordValid && confirmValid
        }
        .assign(to: &$isSignUpDataValid)
    }

    func firstNameValidation(text: String, isEditting _: Bool) -> InputFieldValidation {
        if text.rangeOfCharacter(from: .decimalDigits) != nil {
            isFirstNameValid = false
            return .failure(error: "First name should not contain numbers")
        } else {
            isFirstNameValid = true
            return .success
        }
    }

    func lastNameValidation(text: String, isEditting _: Bool) -> InputFieldValidation {
        if text.rangeOfCharacter(from: .decimalDigits) != nil {
            isLastNameValid = false
            return .failure(error: "Last name should not contain numbers")
        } else {
            isLastNameValid = true
            return .success
        }
    }

    func phoneNumberValidation(text: String, isEditting _: Bool) -> InputFieldValidation {
        if text.rangeOfCharacter(from: .letters) != nil {
            isPhoneNumberValid = false
            return .failure(error: "Phone Numbers should not contain letters")
        } else if text.rangeOfCharacter(from: .whitespacesAndNewlines) != nil {
            isPhoneNumberValid = false
            return .failure(error: "Ensure there are no spaces in phone number")
        } else if text.count < 10 {
            isPhoneNumberValid = false
            return .failure(error: "Phone Number must be 10 digits")
        } else {
            isPhoneNumberValid = true
            return .success
        }
    }

    func emailValidation(text: String, isEditting _: Bool) -> InputFieldValidation {
        let pattern = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#

        if text.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil {
            isEmailValid = true
            return .success
        } else {
            isEmailValid = false
            return .failure(error: "Ensure email follows correct format: example@example.com")
        }
    }

    func passwordValidation(text: String, isEditting _: Bool) -> InputFieldValidation {
        let passwordLengthRequirement = 8

        if text.count <= passwordLengthRequirement {
            isPasswordValid = false
            return .failure(error: "Password must be at least 8 characters long")
        }

        if text.contains(where: { $0.isPunctuation }) == false {
            isPasswordValid = false
            return .failure(error: "Password must contain at least one punctuation mark")
        }

        isPasswordValid = true
        return .success
    }

    func confirmPasswordValidation(text: String, isEditting _: Bool) -> InputFieldValidation {
//        if isEditting {
//            return .success
//        }

        if text != password {
            isConfirmPasswordValid = false
            return .failure(error: "Passwords do not match")
        } else {
            isConfirmPasswordValid = true
            return .success
        }
    }
}
