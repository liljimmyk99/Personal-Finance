//
//  SignInView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 7/14/25.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    @EnvironmentObject var appState: AppState
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var error: String?

    
    var body: some View {
        VStack {
            TextInput(
                text: $email,
                label: "Email",
                validationRules: authManager.emailValidation
            )
            SecureInput(
                text: $password,
                label: "Password",
                validationRules: authManager.passwordValidation
            )
            PFButton(text: "Sign-In") {
                do {
                    try authManager.signIn(email: email, password: password)
                    appState.currentView = .list
                    appState.currentUser = authManager.currentUser
                } catch {
                    self.error = "Invalid email or password"
                }
            }
            PFButton(text: "Cancel", style: .outlined) {
                appState.currentView = .splashScreen
            }
            if let error { Text(error).foregroundColor(PFColors.destructiveButton) }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AppState())
        .environmentObject(AuthenticationManager())
}
