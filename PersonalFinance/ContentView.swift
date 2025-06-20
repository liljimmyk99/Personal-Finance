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
            default:
                NotImplementedView(featureName: appState.currentView.title)
            }
        }
        .animation(.linear, value: appState.currentView)
        .frame(minWidth: 500, minHeight: 500)
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
