//
//  SigninView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct SplashScreen: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 500, height: 500)

            VStack {
                PFButton(text: "Sign In") {
                    appState.currentView = .signIn
                }

                PFButton(text: "Sign Up") {
                    appState.currentView = .signUp
                }

            }
            .padding(.horizontal, 100)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(PFColors.signIn)
    }
}

#Preview {
    SplashScreen()
        .environmentObject(AppState())
}
