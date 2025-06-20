//
//  NotImplementedView.swift
//  Personal Finance
//
//  Created by Jimmy Kane on 5/25/25.
//
import SwiftUI

struct NotImplementedView: View {
    @EnvironmentObject var appState: AppState
    var featureName: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "wrench.and.screwdriver")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .foregroundColor(.gray)

            Text("\(featureName) is not implemented yet.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()

            Text("Please check back in a future update.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            PFButton(text: "Back to Sign-In", style: .outlined) {
                appState.currentView = .signIn
            }
        }
    }
}

#Preview {
    NotImplementedView(featureName: "Preview")
        .environmentObject(AppState())
}
