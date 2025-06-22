//
//  ContentView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            switch appState.currentView {
            case .signIn:
                SigninView()
            case .list:
                ReportsView()
            case .profile:
                ProfileView()
            default:
                NotImplementedView(featureName: appState.currentView.title)
            }
        }
        .toolbar {
            ToolbarItem() {
                if appState.currentView != .signIn {
                    Menu {
                        Button("Profile") {
                            appState.currentView = .profile
                        }
                        Button("Settings") {
                            // Action for Settings
                        }
                        Button("Log Out", role: .destructive) {
                            appState.currentView = .signIn
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
}
