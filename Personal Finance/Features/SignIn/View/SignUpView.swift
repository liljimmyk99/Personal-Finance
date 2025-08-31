//
//  SignUpView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/14/25.
//
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authManager: AuthenticationManager
    @ObservedObject private var viewModel: SignUpViewModel = SignUpViewModel()
    @EnvironmentObject var appState: AppState
    @State private var errorMessage: String?
    
    var body: some View {
        ScrollView {
            TextInput(
                text: $viewModel.firstName,
                label: "First Name",
                validationRules: viewModel.firstNameValidation
            )
            TextInput(
                text: $viewModel.lastName,
                label: "Last Name",
                validationRules: viewModel.lastNameValidation
            )
            TextInput(
                text: $viewModel.phoneNumber,
                label: "Phone Number",
                validationRules: viewModel.phoneNumberValidation
            )
            TextInput(
                text: $viewModel.email,
                label: "Email",
                validationRules: viewModel.emailValidation
            )
            TextInput(
                text: $viewModel.password,
                label: "Password",
                validationRules: viewModel.passwordValidation
            )
            TextInput(
                text: $viewModel.confirmPassword,
                label: "Confirm Password",
                validationRules: viewModel.confirmPasswordValidation
            )
            
            PFButton(
                text: "Create Account",
                isDisabled: (viewModel.isSignUpDataValid == false)
            ) {
                do {
                    if verifyFormCompletion() && verifyPasswordMatch() {
                        try authManager.signUp(firstName: viewModel.firstName, lastName: viewModel.lastName, email: viewModel.email, password: viewModel.password, phoneNumber: viewModel.phoneNumber)
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
        return viewModel.password == viewModel.confirmPassword
    }
    
    func verifyFormCompletion() -> Bool {
        return !viewModel.firstName.isEmpty && !viewModel.lastName.isEmpty && !viewModel.phoneNumber.isEmpty && !viewModel.password.isEmpty && verifyPasswordMatch()
    }
}

#Preview {
    SignUpView()
        .environmentObject(AuthenticationManager())
}
