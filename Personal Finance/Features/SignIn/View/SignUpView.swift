//
//  SignUpView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/14/25.
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authManager: AuthenticationManager
    @EnvironmentObject var appState: AppState
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        ScrollView {
            TextInput(text: $firstName, label: "First Name")
            TextInput(text: $lastName, label: "Last Name")
            TextInput(text: $phoneNumber, label: "Phone Number")
            TextInput(text: $email, label: "Email")
            TextInput(text: $password, label: "Password")
            TextInput(text: $confirmPassword, label: "Confirm Password")
            
            PFButton(text: "Create Account") {
                do {
                    if verifyFormCompletion() && verifyPasswordMatch() {
                       try authManager.signUp(firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber)
                        appState.currentView = .list
                        appState.currentUser = authManager.currentUser
                        
                    } else {
                        errorMessage = "Please fill out all form data and ensure your passwords match."
                    }
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            .padding(.horizontal, 48)
            
            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(PFColors.destructiveButton)
            }
        }
    }
    
    func verifyPasswordMatch() -> Bool {
        return password == confirmPassword
    }
    
    func verifyFormCompletion() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !phoneNumber.isEmpty && !password.isEmpty && verifyPasswordMatch()
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthenticationManager())
}
