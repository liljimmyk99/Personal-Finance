//
//  ContentView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject private var authManager: AuthenticationManager

    var body: some View {
        VStack {
            switch appState.currentView {
            case .splashScreen:
                SplashScreen()
            case .list:
                ReportsTabView()
            case .profile:
                ProfileView()
            case .signIn:
                SignInView()
            case .signUp:
                SignUpView()
            default:
                NotImplementedView(featureName: appState.currentView.title)
            }
        }
        .toolbar {
            if authManager.isSignedin {
            ToolbarItem() {
                    Menu {
                        Button("Profile") {
                            appState.currentView = .profile
                        }
                        Button("Settings") {
                            // Action for Settings
                        }
                        Button("Log Out", role: .destructive) {
                            appState.currentView = .splashScreen
                        }
                    } label: {
                        Label("Profile", systemImage: "person.circle")
                    }
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .animation(.linear, value: appState.currentView)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
        .environmentObject(AuthenticationManager())
}
