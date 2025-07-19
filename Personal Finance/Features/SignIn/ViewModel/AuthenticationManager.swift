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
    private var modelContext: ModelContext?
    
    @AppStorage("signedInUserID") private var signedInUserID: String = ""
    
    func setContext(_ context: ModelContext) {
            self.modelContext = context
            loadSignedInUser()
    }
    
    func loadSignedInUser() {
        guard let modelContext, let uuid = UUID(uuidString: signedInUserID) else { return }
        do {
            let descriptor = FetchDescriptor<User>(predicate: #Predicate { $0.id == uuid })
            if let user = try modelContext.fetch(descriptor).first {
                self.currentUser = user
            }
        } catch {
            print("Failed to load signed-in user: \(error)")
        }
    }
    
    func signUp(
        firstName: String,
        lastName: String,
        email: String,
        password: String,
        phoneNumber: String
    ) throws {
        guard let modelContext else { return }
        
        let passwordHash = Self.hashPassword(password)
        let user = User(
             firstName: firstName,
             lastName: lastName,
             email: email,
             phoneNumber: phoneNumber,
             passwordHash: passwordHash
        )
        
        modelContext.insert(user)
        try modelContext.save()
        
        signedInUserID = user.id.uuidString
        currentUser = user
        isSignedin = true
    }
    
    func signIn(email: String, password: String) throws {
        guard let modelContext else { return }
        
        let hashed = Self.hashPassword(password)
        
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate { $0.email == email && $0.passwordHash == hashed }
        )
        
        let results = try modelContext.fetch(descriptor)
        guard let user = results.first else {
            throw NSError(domain: "InvalidCredentials", code: 401, userInfo: nil)
        }
        
        signedInUserID = user.id.uuidString
        currentUser = user
        isSignedin = true
    }
    
    func signOut() {
        signedInUserID = ""
        currentUser = nil
        isSignedin = false
    }
    
    static func hashPassword(_ password: String) -> String {
            let inputData = Data(password.utf8)
            let hashed = SHA256.hash(data: inputData)
            return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
}
