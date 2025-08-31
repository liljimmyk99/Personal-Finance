//
//  SignInViewModel.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/13/25.
//
import CryptoKit
import SwiftData
import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var currentUser: User?
    @Published var isSignedin: Bool = false
    private let database = AppDatabase.shared
    
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
        
        print ("Before UserID: \(user.id)")
        do {
            try AppDatabase.shared.saveUser(&user)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        print ("After UserID: \(user.id!)")
        
        
        currentUser = user
        isSignedin = true
    }
    
    func signIn(email: String, password: String) throws {
        
        let hashed = Self.hashPassword(password)
        
        let user = try database.getUserByEmail(email)
        if (!(user.passwordHash == hashed)) {
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
    func emailValidation(text: String, isEditting: Bool) -> InputFieldValidation {
        let pattern = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#

        if (text.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil) {
            return .success
        } else {
            return .failure(error: "Ensure email follows correct format: example@example.com")
        }

    }
    
    // TODO: Merge with SignUpViewModel
    func passwordValidation(text: String, isEditting: Bool) -> InputFieldValidation {
        let passwordLengthRequirement: Int = 8
        
        if text.count <= passwordLengthRequirement {
            return .failure(error: "Password must be at least 8 characters long")
        }
        
        if text.contains(where: {$0.isPunctuation}) == false {
            return .failure(error: "Password must contain at least one punctuation mark")
        }
        
        return .success
    }
    
}
