//
//  SignInViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/13/25.
//
import Combine
import CryptoKit
import SwiftData
import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var currentUser: User?
    @Published var isSignedin: Bool = false
    @Published private(set) var isEmailValid: Bool = false
    @Published private(set) var isPasswordValid: Bool = false
    @Published var isSignInDataValid: Bool = false

    private let database = AppDatabase.shared

    init() {
        // Allows for short credentials for QA to be used
        #if !DEBUG
            Publishers.CombineLatest(
                $isEmailValid,
                $isPasswordValid
            )
            .map { group in
                let (isEmailValid, isPasswordValid) = group
                return isEmailValid && isPasswordValid
            }
            .assign(to: &$isSignInDataValid)

        #else
            isSignInDataValid = true
        #endif
    }

    func signUp(
        firstName: String,
        lastName: String,
        email: String,
        password: String,
        phoneNumber: String
    ) throws {
        let passwordHash = Self.hashPassword(password)

        var user = User(
            id: nil,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phoneNumber: phoneNumber,
            passwordHash: passwordHash
        )

        do {
            try AppDatabase.shared.saveUser(&user)
        } catch {
            fatalError(error.localizedDescription)
        }

        currentUser = user
        isSignedin = true
    }

    func signIn(email: String, password: String) throws {
        let hashed = Self.hashPassword(password)

        let user = try database.getUserByEmail(email)
        if !(user.passwordHash == hashed) {
            throw NSError(domain: "InvalidCredentials", code: 401, userInfo: nil)
        }

        currentUser = user
        isSignedin = true
    }

    func signOut() {
        currentUser = nil
        isSignedin = false
    }

    static func hashPassword(_ password: String) -> String {
        let inputData = Data(password.utf8)
        let hashed = SHA256.hash(data: inputData)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }

    // TODO: Merge with SignUpViewModel
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

    // TODO: Merge with SignUpViewModel
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
}
