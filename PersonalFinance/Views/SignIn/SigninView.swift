//
//  SigninView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct SigninView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 50, height: 50)

            VStack {
                PFButton(text: "Sign In") {
                    appState.currentView = .list
                }

                PFButton(text: "Sign Up", style: .outlined) {
                    appState.currentView = .calendar
                }

            }.padding(.horizontal, 108)
        }
    }
}

#Preview {
    SigninView()
        .environmentObject(AppState())
}
